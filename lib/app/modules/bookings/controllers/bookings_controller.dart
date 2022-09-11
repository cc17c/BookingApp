import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BookingsController extends GetxController {
  static BookingsController get to => Get.find();
  RxBool isLoading = false.obs;
  RxList? bookingsList = [].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getBookings() async {
    try {
      isLoading.value = true;
      CollectionReference data =
          await FirebaseFirestore.instance.collection('bookings');
      QuerySnapshot<Object?> doctorsID = await data.get();

      bookingsList?.clear();
      for (var element in doctorsID.docs) {
        bookingsList?.add(await element.data());
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
