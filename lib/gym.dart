import 'dart:developer';
import 'dart:math';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/collections/controler.dart';
import 'package:demo_project/gymsduled.dart';
import 'package:demo_project/model/bookmodel.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/schuduledswim.dart';
import 'package:demo_project/successfully.dart';
import 'package:demo_project/utils/string.dart';
import 'package:demo_project/view/security/add_cab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class bookingpagegym extends StatefulWidget {
  const bookingpagegym({super.key});

  @override
  State<bookingpagegym> createState() => _bookingpageState();
}

class _bookingpageState extends State<bookingpagegym> {
  final fromcont = TextEditingController();
  String? _selectedUserType;
  List<String> usertype = ['Gym'];
  TimeOfDay? _selectedTime;
  TimeOfDay? _selectedEndTime;

  Future<void> showStartTimePicker() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Future<void> showEndTimePicker() async {
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedEndTime != null) {
      setState(() {
        _selectedEndTime = pickedEndTime;
      });
    }
  }

  final db = FirebaseFirestore.instance;

  DateTime selecdate = DateTime.now();
  TimeOfDay? _selectedend;

  Future<void> timepickerto() async {
    TimeOfDay? pickedFile =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    setState(() {
      _selectedend = pickedFile;
    });
  }

  DateTime selecdated = DateTime.now();

  final roomnocontrooler = TextEditingController();
  final timefrom = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final flore = {
    'Flore 1',
    'Flore 2',
    'Flore 3',
    'Flore 4',
  };

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<HelperProvider>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(" Booking")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
          bottom: TabBar(
            tabs: [
              Tab(text: "Booking"),
              Tab(text: "Scheduled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              //  width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Container(
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/gym.jpeg'), // Replace 'assets/image.jpg' with your image path
                                  fit: BoxFit
                                      .cover, // Adjust how the image fits inside the container
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  "@book Now",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Enjoy Your Life",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Maximum Three Hours is Allowed!",
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        SizedBox(
                          width: ResHelper.w(context) * .5,
                          child: Consumer<HelperProvider>(
                            builder: (context, helper, child) {
                              return DropdownButtonFormField(
                                hint: Text('Select flore'),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                                items: flore.map((e) {
                                  return DropdownMenuItem(
                                    value: e.toString(),
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  helper.selectedflorebil(value);
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 39,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[A-Fa-f0-99]')),
                            ],
                            // controller: provide.roomno,
                            // initialValue:
                            //     provide.roomnumbercontroller.toString(),

                            decoration: InputDecoration(
                              hintText: "Room No",
                            ),
                            validator: (value) {
                              if (value!.isEmpty && value == null) {
                                return 'add value';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 250, top: 15),
                          child: Text(
                            "Time:",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Consumer<HelperProvider>(
                          builder: (context, value, child) {
                            return Builder(builder: (context) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildContainer(
                                        ontap: () {
                                          provide.selectSlot(1, '6:00 - 9:00 ');
                                        },
                                        text: '6:00 - 9:00 ',
                                        color: provide.selectedIndex == 1
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      buildContainer(
                                        ontap: () {
                                          provide.selectSlot(
                                              2, '9:00 - 11:00 ');
                                        },
                                        text: '9:00 - 11:00 ',
                                        color: provide.selectedIndex == 2
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      buildContainer(
                                        ontap: () {
                                          provide.selectSlot(3, '11:00 - 1:00');
                                        },
                                        text: '11:00 - 1:00 ',
                                        color: provide.selectedIndex == 3
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              );
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Consumer<HelperProvider>(
                          builder: (context, value, child) {
                            return Builder(builder: (context) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildContainer(
                                        ontap: () {
                                          provide.selectSlot(4, '1:00 - 3:00 ');
                                        },
                                        text: '1:00 - 3:00',
                                        color: provide.selectedIndex == 4
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      buildContainer(
                                        ontap: () {
                                          provide.selectSlot(5, '3:00 - 6:00 ');
                                        },
                                        text: '3:00 - 6:00',
                                        color: provide.selectedIndex == 5
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      buildContainer(
                                        ontap: () {
                                          provide.selectSlot(6, '6:00 - 9:00');
                                        },
                                        text: '6:00 PM- 9:00 PM ',
                                        color: provide.selectedIndex == 6
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              );
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                // filled: true,
                                hintText: selecdate != null
                                    ? "${selecdate!.day}/${selecdate!.month}/${selecdate!.year}"
                                    : "Date",
                                // hintText: " Name",
                                // prefixIcon: Icon(Icons.person),
                                // fillColor: Color(0xFFF3EEEE),
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      final DateTime? date =
                                          await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(3000));

                                      if (selecdate != null) {
                                        setState(() {
                                          selecdate = date!;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.date_range))),
                          ),
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(hintText: " Booking for"),
                          items: usertype.map((e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedUserType = value.toString();
                              // log(_selectedUserType.toString());
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: 100,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 12, 184, 193)),
                              onPressed: () async {
                                final formattedDate =
                                    DateFormat('dd-MM-yyyy').format(selecdate);
                                if (provide.roomno.text != null &&
                                    provide.selectedslot.toString() != null &&
                                    _selectedUserType.toString() != null &&
                                    provide.selectedslot.toString() != null &&
                                    selecdate.toString() != null) {
                                  await Controller()
                                      .addgym(
                                          BookModel(
                                            RoomeNo: provide.roomno.text,
                                            to: provide.selectedslot.toString(),
                                            Date: formattedDate,
                                            Type: _selectedUserType.toString(),
                                            selecflore: provide.selectedflore
                                                .toString(),
                                          ),
                                          provide.selectedslot.toString(),
                                          context,
                                          selecdate.toString(),
                                          auth.currentUser!.uid)
                                      .then((value) {
                                    clear();
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('please fill the form')));
                                }
                              },
                              child: Text(
                                "Ok",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bookingsheduledgym(),
          ],
        ),
      ),
    );
  }

  clear() {
    _selectedTime = null;
    roomnocontrooler.clear();
  }

  Widget buildContainer(
      {required String text, required Color color, Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Text(text),
      ),
    );
  }
}
