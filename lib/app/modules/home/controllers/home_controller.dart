import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  RxList selectedPage = [true, false, false, false, false].obs;
  String date = "";
  String time = "";
  RxList<DateTime> offDateList = <DateTime>[].obs;
  RxList doctorsList = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
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
    print(offDateList);
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getDoctorsList() async {
    int length = 0;
    CollectionReference data =
        await FirebaseFirestore.instance.collection('doctors');
    QuerySnapshot<Object?> doctorsID = await data.get();
    for (var element in doctorsID.docs) {
      doctorsList.add(await element.data());
    }

    print(doctorsList);
  }
}
