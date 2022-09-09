import 'package:get/get.dart';

import 'package:booking_app/app/modules/bookings/bindings/bookings_binding.dart';
import 'package:booking_app/app/modules/bookings/views/bookings_view.dart';
import 'package:booking_app/app/modules/home/bindings/home_binding.dart';
import 'package:booking_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGS,
      page: () => BookingsView(),
      binding: BookingsBinding(),
    ),
  ];
}
