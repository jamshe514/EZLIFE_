import 'package:demo_project/view/security/add_cab.dart';
import 'package:demo_project/view/security/add_delivery.dart';
import 'package:demo_project/view/security/add_guest.dart';
import 'package:demo_project/view/security/home.dart';
import 'package:flutter/material.dart';

class more_add extends StatefulWidget {
  const more_add({super.key});

  @override
  State<more_add> createState() => _more_addState();
}

class _more_addState extends State<more_add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("more")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              height: 900,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => add_guest()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    width: 350,
                    child: Row(children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 180, top: 6),
                        child: Text(
                          "Guests",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => adddevivery()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(children: [
                          Icon(Icons.pedal_bike),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 180, top: 6),
                            child: Text(
                              "Delivery",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => add_cab()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 60,
                        width: 350,
                        child: Row(children: [
                          Icon(Icons.car_crash),
                          Padding(
                            padding: const EdgeInsets.only(right: 180, top: 6),
                            child: Text(
                              "Cab",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // InkWell(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(),
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     height: 60,
                    //     width: 350,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 10),
                    //       child: Row(children: [
                    //         Icon(Icons.pedal_bike),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Padding(
                    //           padding:
                    //               const EdgeInsets.only(right: 180, top: 6),
                    //           child: Text(
                    //             "Delivery",
                    //             style: TextStyle(fontSize: 20),
                    //           ),
                    //         ),
                    //       ]),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 60,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(children: [
                            Icon(Icons.pedal_bike),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 180, top: 6),
                              child: Text(
                                "Mainteance",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 60,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(children: [
                            Icon(Icons.pedal_bike),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 180, top: 6),
                              child: Text(
                                "Repairing",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 60,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(children: [
                            Icon(Icons.pedal_bike),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 180, top: 6),
                              child: Text(
                                "Other",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // InkWell(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(),
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     height: 60,
                    //     width: 350,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 10),
                    //       child: Row(children: [
                    //         Icon(Icons.pedal_bike),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Padding(
                    //           padding:
                    //               const EdgeInsets.only(right: 180, top: 6),
                    //           child: Text(
                    //             "Delivery",
                    //             style: TextStyle(fontSize: 20),
                    //           ),
                    //         ),
                    //       ]),
                    //     ),
                    //   ),
                    // ),
                  ]),
                ])
              ])),
        ));
  }
}
