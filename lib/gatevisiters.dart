import 'dart:developer';

import 'package:demo_project/model/notificationgust.dart';
import 'package:demo_project/view/users/addvisiterspage.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/model/usermodel.dart';
import 'package:demo_project/parcel.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class visitors extends StatefulWidget {
  const visitors({super.key});

  @override
  State<visitors> createState() => _visitorsState();
}

class _visitorsState extends State<visitors> {
  bool isclick = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Gate Updates ")),
            backgroundColor: Color.fromARGB(44, 24, 255, 216),
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bottomnavipage(
                        indexnum: 0,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            bottom: TabBar(
              tabs: [
                Tab(text: "visitors"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Consumer<HelperProvider>(
                    builder: (context, instance, child) {
                      return StreamBuilder(
                        stream: instance.getguest().asStream(),
                        builder: (context, snapshot) {
                          final data = instance.gesmodel;
                          return data.isEmpty
                              ? Center(
                                  child: TextButton(
                                    onPressed: () {
                                      log(auth.currentUser!.uid);
                                    },
                                    child: Text('no visiters this time!'),
                                  ),
                                )
                              : ListView.separated(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 400,
                                          // height: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 12),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                        'Name: ${data[index].guestname}'),
                                                    // Text(data[index].guestname),
                                                    SizedBox(
                                                      width: 150,
                                                    ),
                                                    // TextButton(
                                                    //     onPressed: () {},
                                                    //     child:
                                                    //         Text("view More"))
                                                  ],
                                                ),
                                                Text(
                                                    'Phone No ${data[index].phonenumber}'),
                                                // Text(data[index].phonenumber),
                                                // SizedBox(
                                                //   height: 5,
                                                // ),
                                                Text(
                                                    'Vehicle No: ${data[index].vehiclenumber}'),
                                                // Text(data[index].vehiclenumber),
                                                // SizedBox(
                                                //   height: 10,
                                                // ),
                                                // Text("Time:11:00am"),
                                                // SizedBox(
                                                //   height: 10,
                                                // ),
                                                Text(
                                                    'Visiters Status: ${data[index].status}'),
                                                Text(
                                                    'Visiters type : ${data[index].typeguest}'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 80),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 120,
                                                        height: 30,
                                                        child: data[index]
                                                                    .status ==
                                                                'Pending'
                                                            ? ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  foregroundColor:
                                                                      const Color
                                                                          .fromARGB(
                                                                    255,
                                                                    255,
                                                                    252,
                                                                    252,
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  db
                                                                      .collection(
                                                                          'Guest')
                                                                      .doc(data[
                                                                              index]
                                                                          .id)
                                                                      .update({
                                                                    'Status':
                                                                        'Ok'
                                                                  }).then((value) {
                                                                    instance.addNotificationGust(NotificationGust(
                                                                        msg:
                                                                            'let him free ',
                                                                        gustid: data[index]
                                                                            .id
                                                                            .toString()));
                                                                  });
                                                                },
                                                                child: Text(
                                                                    "Approved"))
                                                            : Visibility(
                                                                visible: data[
                                                                            index]
                                                                        .status ==
                                                                    'Ok',
                                                                child: Text(
                                                                    ' approved')),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      data[index].status ==
                                                              'Pending'
                                                          ? SizedBox(
                                                              width: 110,
                                                              height: 30,
                                                              child:
                                                                  ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Colors
                                                                              .red,
                                                                          foregroundColor: Colors
                                                                              .black),
                                                                      onPressed:
                                                                          () {
                                                                        db
                                                                            .collection(
                                                                                'Guest')
                                                                            .doc(data[index]
                                                                                .id)
                                                                            .update({
                                                                          'Status':
                                                                              'reject'
                                                                        }).then((value) {
                                                                          instance.addNotificationGust(NotificationGust(
                                                                              msg: 'note aproved ',
                                                                              gustid: data[index].id.toString()));
                                                                        });
                                                                      },
                                                                      child: Text(
                                                                          "Rejected")),
                                                            )
                                                          : Visibility(
                                                              visible: data[
                                                                          index]
                                                                      .status ==
                                                                  'reject',
                                                              child: Text(
                                                                  ' Rejected')),
                                                      SizedBox(
                                                        height: 50,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(top: 300),
                                        //   child: SizedBox(
                                        //     width: 150,
                                        //     height: 40,
                                        //     child: ElevatedButton(
                                        //       style: ElevatedButton.styleFrom(
                                        //           backgroundColor: Color.fromARGB(
                                        //               255, 12, 184, 193)),
                                        //       onPressed: () {
                                        //         Navigator.push(
                                        //             context,
                                        //             MaterialPageRoute(
                                        //                 builder: (context) =>
                                        //                     addvisitors()));
                                        //       },
                                        //       child: Text(
                                        //         "Add Visitores",
                                        //         style: TextStyle(color: Colors.black),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: ResHelper.h(context) * .050,
                                    );
                                  },
                                );
                        },
                      );
                    },
                  )),
            ],
          )),
    );
  }
}
