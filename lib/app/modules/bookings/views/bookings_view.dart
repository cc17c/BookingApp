import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
        body: Obx(
          () => controller.isLoading.value == true
              ? Center(child: CircularProgressIndicator())
              : controller.bookingsList!.isEmpty
                  ? Center(
                      child: Text(
                      'No Bookings Found',
                      style: TextStyle(fontSize: 20),
                    ))
                  : CustomScrollView(
                      slivers: <Widget>[
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: Get.width / 3,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 3.0,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              var bookingData = controller.bookingsList?[index];
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          bookingData['doctor_detail']
                                                  ['name'] ??
                                              '',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        DateTime.fromMicrosecondsSinceEpoch(
                                                    bookingData['date_time']
                                                        .microsecondsSinceEpoch)
                                                .isAfter(DateTime.now())
                                            ? Text(
                                                'Appointment is on ' +
                                                    DateFormat('EEEE dd MMMM')
                                                        .format(getTime(
                                                            bookingData[
                                                                'date_time'])) +
                                                    ' at ' +
                                                    DateFormat('hh:mm a')
                                                        .format(getTime(
                                                            bookingData[
                                                                'date_time'])),
                                                style: TextStyle(
                                                    color: Colors.blueGrey[600],
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            : Text(
                                                'Appintment was ' +
                                                    DateFormat('EEEE dd MMMM')
                                                        .format(getTime(
                                                            bookingData[
                                                                'date_time'])) +
                                                    ' at ' +
                                                    DateFormat('hh:mm a')
                                                        .format(getTime(
                                                            bookingData[
                                                                'date_time'])),
                                                style: TextStyle(
                                                    color: Colors.blueGrey[600],
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                      ],
                                    ).paddingAll(10),
                                  ),
                                ),
                              );
                            },
                            childCount: controller.bookingsList?.length ?? 0,
                          ),
                        )
                      ],
                    ).paddingAll(10),
        ));
  }
}

getTime(Timestamp timestamp) {
  var dateTime =
      DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch);
  return dateTime;
}
