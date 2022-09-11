import 'package:booking_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_successful_controller.dart';

class BookingSuccessfulView extends GetView<BookingSuccessfulController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.check_circle,
            size: 200,
            color: Colors.green,
          ),
          Obx(() => Text(
                controller.appointText.value,
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 40,
            child: OutlinedButton.icon(
                onPressed: () {
                  Get.offAllNamed(Routes.HOME);
                },
                icon: Icon(Icons.home, size: 30),
                label: Text(
                  'Go to Home',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ),
        ],
      ).paddingAll(10),
    ));
  }
}
