import 'package:booking_app/app/modules/booking_successful/controllers/booking_successful_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  CalendarController calenderController = CalendarController();
  static HomeController get to => Get.find();
  CollectionReference bookAppointment =
      FirebaseFirestore.instance.collection('bookings');
  RxList selectedPage = [
    true,
    false,
  ].obs;

  DateTime? appointmentDate;

  RxList<DateTime> offDateList = <DateTime>[].obs;
  RxList? doctorsList = [].obs;
  RxMap? choosedDoctor = {}.obs;
  final count = 0.obs;
  @override
  void onInit() {
    calenderController.addPropertyChangedListener((p0) {
      if (doctorsList!.isNotEmpty) {
        if (p0 == "calendarView") {
          doctorsList?.clear();
          appointmentDate = null;
        }
      }
    });
    super.onInit();
  }

  @override
  void onReady() async {
    var collection = await FirebaseFirestore.instance
        .collection('totally_off_days')
        .doc('off_days_list')
        .get();

    var data2 = collection.data();
    for (Timestamp element in data2!['off_days']) {
      offDateList.add(
          DateTime.fromMicrosecondsSinceEpoch(element.microsecondsSinceEpoch));
    }

    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getDoctorsList() async {
    CollectionReference data =
        await FirebaseFirestore.instance.collection('doctors');
    QuerySnapshot<Object?> doctorsID = await data.get();

    doctorsList?.clear();
    for (var element in doctorsID.docs) {
      doctorsList?.add(await element.data());
    }
  }

  bookAppoint(BuildContext context, Map data) async {
    Map _data = {
      "date_time": appointmentDate,
      "doctor_detail": {
        "name": choosedDoctor?['name'],
        "degree": choosedDoctor?['degree'],
        "image": choosedDoctor?['image']
      },
      "reason": data['reason'],
      "symptom": data['symptoms']
    };

    await bookAppointment
        .add(Map<String, dynamic>.from(_data))
        .then((value) => BookingSuccessfulController.to.appointText.value =
            " Your appointment for ${DateFormat('HH:mm a').format(HomeController.to.appointmentDate!)} on ${DateFormat('EEEE').format(HomeController.to.appointmentDate!)} ${DateFormat('dd MMMM yyyy').format(HomeController.to.appointmentDate!)} with ${HomeController.to.choosedDoctor?['name']} has been booked")
        .then((value) => Get.offAllNamed(Routes.BOOKING_SUCCESSFUL))
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Appointment Booked'),
              backgroundColor: Colors.white,
            )))
        .onError((error, stackTrace) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong')));
    });
  }
}
