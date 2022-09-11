import 'package:booking_app/app/modules/booking_successful/controllers/booking_successful_controller.dart';
import 'package:booking_app/app/modules/bookings/controllers/bookings_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BookingSuccessfulController>(
      () => BookingSuccessfulController(),
    );
    Get.lazyPut<BookingsController>(
      () => BookingsController(),
    );
  }
}
