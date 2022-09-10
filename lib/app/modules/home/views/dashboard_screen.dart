import 'package:booking_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        // padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            AspectRatio(aspectRatio: 1, child: CalenderWidget()),
            // TextButton(onPressed: () {}, child: Text('data'))
          ],
        ),
      ),
    );
  }
}

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => HomeController.to.offDateList.isEmpty
            ? CircularProgressIndicator()
            : SfCalendar(
                view: CalendarView.month,
                todayHighlightColor: Colors.transparent,
                allowViewNavigation: true,
                minDate: DateTime.now(),
                controller: HomeController.to.calenderController,
                onTap: (ss) async {
                  HomeController.to.appointmentDate = ss.date;
                  String time = DateFormat('HH:mm')
                      .format(HomeController.to.appointmentDate!);

                  if (time != "00:00") {
                    await HomeController.to.getDoctorsList();
                  }
                },
                // onViewChanged: (data) async {
                //   if (data.visibleDates.length != 1 &&
                //       HomeController.to.doctorsList!.isNotEmpty) {
                //     HomeController.to.doctorsList?.clear();
                //   }
                // },
                // onSelectionChanged: (ss) {
                //   print(ss.date);
                // },
                // onAppointmentResizeEnd: (ss) {
                //   print(ss.appointment);
                // },
                // onAppointmentResizeStart: (ss) {
                //   print(ss.appointment);
                // },
                // onAppointmentResizeUpdate: (ss) {
                //   print(ss.appointment);
                // },

                timeSlotViewSettings: TimeSlotViewSettings(
                    minimumAppointmentDuration: Duration(minutes: 15),
                    timeFormat: 'h:mm a',
                    timeIntervalHeight: 60,
                    timeRulerSize: 100,
                    startHour: 9,
                    endHour: 19,
                    nonWorkingDays: <int>[DateTime.saturday, DateTime.sunday],
                    timelineAppointmentHeight: 60,
                    timeTextStyle: TextStyle(fontSize: 13, color: Colors.white),
                    timeInterval: Duration(minutes: 15)),
                blackoutDates: HomeController.to.offDateList,
                showNavigationArrow: true,
                blackoutDatesTextStyle: TextStyle(color: Colors.grey),
                allowedViews: [CalendarView.month],
                // dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
              )));
  }

  List<Meeting> _getDataSource() {
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 8, 0, 0);
    final DateTime endTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);

    final List<Meeting> meetings = <Meeting>[
      Meeting('Available', startTime, endTime, const Color(0xFF0F8644), false),
      Meeting('Available', startTime, endTime, const Color(0xFF0F8644), false),
    ];

    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

List<DateTime>? date = [
  DateTime(2022, 09, 12, 9, 0, 0),
  DateTime(2022, 09, 09, 9, 0, 0),
  DateTime(2022, 09, 14, 9, 0, 0),
  DateTime(2022, 09, 29, 9, 0, 0),
  DateTime(2022, 09, 2, 9, 0, 0),
  DateTime(2022, 09, 9, 9, 0, 0),
  DateTime(2022, 09, 13, 9, 0, 0),
  DateTime(2022, 09, 19, 9, 0, 0),
];

List<int> nonWorkingDays = const <int>[DateTime.saturday, DateTime.sunday];
