import 'package:booking_app/app/modules/bookings/controllers/bookings_controller.dart';
import 'package:booking_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Obx(
      () => ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            color: HomeController.to.selectedPage[0] == true
                ? Colors.black12
                : Colors.transparent,
            press: () async {
              HomeController.to.selectedPage[0] = true;
              HomeController.to.selectedPage[1] = false;
              HomeController.to.calenderController.view = CalendarView.month;
              // if (HomeController.to.selectedPage[0] == false) {

              // }
            },
          ),
          DrawerListTile(
            title: "Bookings",
            svgSrc: "assets/icons/menu_tran.svg",
            color: HomeController.to.selectedPage[1] == true
                ? Colors.black12
                : Colors.transparent,
            press: () async {
              if (HomeController.to.selectedPage[1] == false) {
                HomeController.to.selectedPage[1] = true;
                HomeController.to.selectedPage[0] = false;
                HomeController.to.doctorsList?.clear();
                await BookingsController.to.getBookings();
              }
            },
          ),
          // DrawerListTile(
          //   title: "Task",
          //   svgSrc: "assets/icons/menu_task.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Documents",
          //   svgSrc: "assets/icons/menu_doc.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Store",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Notification",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Profile",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Settings",
          //   svgSrc: "assets/icons/menu_setting.svg",
          //   press: () {},
          // ),
        ],
      ),
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.color,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      tileColor: color,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
