import 'package:booking_app/app/modules/bookings/views/bookings_view.dart';
import 'package:booking_app/app/modules/home/views/dashboard_screen.dart';
import 'package:booking_app/app/modules/home/views/doctors_list.dart';
import 'package:booking_app/app/modules/home/views/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utilities/responsive.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Obx(() => Expanded(
                  // It takes 5/6 part of the screen
                  flex: 5,
                  child: HomeController.to.selectedPage[0] == true
                      ? DashboardScreen()
                      : HomeController.to.selectedPage[1] == true
                          ? BookingsView()
                          : DashboardScreen(),
                )),
            DoctorsList()
          ],
        ),
      ),
    );
  }
}
