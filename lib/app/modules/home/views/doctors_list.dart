import 'package:booking_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormBuilderState>();

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: HomeController.to.doctorsList!.isNotEmpty,
        child: Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Opacity(
                  opacity: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Available Doctors',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey[500]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 180,
                          height: Get.height,
                          child: ListView.builder(
                            itemCount: HomeController.to.doctorsList?.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = HomeController.to.doctorsList?[index];

                              for (var i = 0;
                                  i < data['off_days'].length;
                                  i++) {
                                if (HomeController.to.appointmentDate!
                                    .isAtSameMomentAs(
                                        DateTime.fromMicrosecondsSinceEpoch(
                                            data['off_days'][i]
                                                .microsecondsSinceEpoch))) {
                                  return SizedBox.shrink();
                                } else {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(3),
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(100),
                                                topRight: Radius.circular(100)),
                                            color: data['selected'] == false
                                                ? Color.fromARGB(
                                                    255, 222, 222, 222)
                                                : Colors.blue),
                                        child: InkWell(
                                          onTap: () {
                                            for (var i = 0;
                                                i <
                                                    HomeController
                                                        .to.doctorsList!.length;
                                                i++) {
                                              if (i == index) {
                                                if (HomeController
                                                            .to.doctorsList![i]
                                                        ['selected'] !=
                                                    true) {
                                                  HomeController
                                                          .to.doctorsList![i]
                                                      ['selected'] = true;
                                                  HomeController
                                                          .to
                                                          .choosedDoctor
                                                          ?.value =
                                                      HomeController
                                                          .to.doctorsList![i];
                                                } else if (HomeController
                                                            .to.doctorsList![i]
                                                        ['selected'] ==
                                                    true) {
                                                  HomeController
                                                          .to.doctorsList![i]
                                                      ['selected'] = false;
                                                  HomeController
                                                      .to
                                                      .choosedDoctor
                                                      ?.value = {};
                                                }
                                              } else if (HomeController
                                                          .to.doctorsList![i]
                                                      ['selected'] ==
                                                  true) {
                                                HomeController
                                                        .to.doctorsList![i]
                                                    ['selected'] = false;
                                              }

                                              //   if (HomeController.to.doctorsList![i]
                                              //           ['selected'] !=
                                              //       true) {
                                              //     if (i == index) {
                                              //       HomeController.to.doctorsList![i]
                                              //           ['selected'] = true;
                                              //       HomeController
                                              //               .to.choosedDoctor?.value =
                                              //           HomeController
                                              //               .to.doctorsList![i];
                                              //     } else {
                                              //       HomeController.to.doctorsList![i]
                                              //           ['selected'] = false;
                                              //     }
                                              //   } else {
                                              //     HomeController.to.doctorsList![i]
                                              //         ['selected'] = false;
                                              //     HomeController
                                              //         .to.choosedDoctor?.value = {};
                                              //   }
                                            }
                                            HomeController.to.doctorsList!
                                                .refresh();
                                            print(HomeController
                                                .to.choosedDoctor);
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 150,
                                                width: 180,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    100),
                                                            topRight: Radius
                                                                .circular(100)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            data['image']))),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  data['name'] ?? '',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  data['degree'] ?? '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider()
                                    ],
                                  );
                                }
                              }
                              return SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(Container(
                      height: Get.height,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            // flex: 2,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(3),
                                  height: Get.height / 2,
                                  width: Get.width / 5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(500),
                                          topRight: Radius.circular(500)),
                                      color: HomeController.to
                                                  .choosedDoctor?['selected'] ==
                                              false
                                          ? Color.fromARGB(255, 222, 222, 222)
                                          : Colors.blue),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: Get.height / 2.5,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(500),
                                                topRight: Radius.circular(500)),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    HomeController
                                                            .to.choosedDoctor?[
                                                        'image']))),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          HomeController
                                                  .to.choosedDoctor?['name'] ??
                                              '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          HomeController.to
                                                  .choosedDoctor?['degree'] ??
                                              '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider()
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: FormBuilder(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Appointment for ${DateFormat('HH:mm a').format(HomeController.to.appointmentDate!)} on ${DateFormat('EEEE').format(HomeController.to.appointmentDate!)} ${DateFormat('dd-MM-yyyy').format(HomeController.to.appointmentDate!)} with ${HomeController.to.choosedDoctor?['name']}",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FormBuilderTextField(
                                    name: 'reason',
                                    maxLines: 5,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText:
                                          'What is the reason for this appointment (required)',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      contentPadding: const EdgeInsets.only(
                                          left: 25, top: 20, bottom: 20),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 215, 215, 215)),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.lime, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.minLength(10,
                                          errorText:
                                              'Explain atlease 10 charecter'),
                                    ]),
                                  ),
                                  FormBuilderTextField(
                                    name: 'symptoms',
                                    style: TextStyle(color: Colors.black),
                                    maxLines: 2,
                                    decoration: InputDecoration(
                                      hintText:
                                          'What symptoms are you experiencing (required)',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      contentPadding: const EdgeInsets.only(
                                          left: 25, top: 20, bottom: 20),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 215, 215, 215)),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.lime, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.minLength(10,
                                          errorText:
                                              'Explain atlease 10 charecter'),
                                    ]),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState
                                                ?.saveAndValidate() ??
                                            true) {
                                          HomeController.to.bookAppoint(context,
                                              _formKey.currentState!.value);
                                        }
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  Size.fromHeight(60))),
                                      child: Text(
                                        'Book Appointment',
                                        style: TextStyle(fontSize: 22),
                                      ))
                                ],
                              ).paddingAll(15),
                            ),
                          )
                        ],
                      ),
                    ));
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height:
                        HomeController.to.choosedDoctor!.isNotEmpty ? 60 : 0,
                    width: Get.width,
                    color: Colors.blue,
                    child: Center(child: Text('Book Appointment')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
