import 'package:get/get.dart';

class BookingSuccessfulController extends GetxController {
  static BookingSuccessfulController get to => Get.find();

  RxString appointText = "".obs;

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
}
