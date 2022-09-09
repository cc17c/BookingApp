import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bookings_controller.dart';

class BookingsView extends GetView<BookingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: Get.width / 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Booked!',
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Colors.blueGrey[500],
                                // fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Dr. Alka Yagnik!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '09-Oct-2022 12:40Pm',
                            style: TextStyle(
                                color: Colors.blueGrey[600],
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ).paddingAll(10),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ).paddingAll(10),
    );
  }
}
