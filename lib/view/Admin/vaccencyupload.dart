import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:demo_project/view/Admin/home.dart';
import 'package:demo_project/model/Roomvacency.dart';
import 'package:demo_project/model/flore_model.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Uploadvaccency extends StatelessWidget {
  Uploadvaccency({super.key});

  final florenumber = TextEditingController();

  final flore = {
    'Flore 1',
    'Flore 2',
    'Flore 3',
    'Flore 4',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'UPLOAD ROOM VACCENCY',
                style: TextStyle(
                  fontSize: ResHelper.w(context) * .020,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: ResHelper.h(context) * .030,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<HelperProvider>(
                builder: (context, helper, child) {
                  return StreamBuilder(
                    stream: helper.getroomvaccency('Flore 1'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Floremodel> list = [];

                      list = snapshot.data!.docs.map((e) {
                        return Floremodel.fromjason(
                            e.data() as Map<String, dynamic>);
                      }).toList();

                      if (snapshot.hasData) {
                        return SizedBox(
                          width: 200,
                          child: DropdownButtonFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            hint: Text('this flore 1'),
                            items: list.map((e) {
                              return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e.floreno),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        );
                      }
                      return Container();
                    },
                  );
                },
              ),
              Consumer<HelperProvider>(
                builder: (context, helper, child) {
                  return StreamBuilder(
                    stream: helper.getroomvaccency('Flore 2'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Floremodel> list = [];

                      list = snapshot.data!.docs.map((e) {
                        return Floremodel.fromjason(
                            e.data() as Map<String, dynamic>);
                      }).toList();

                      if (snapshot.hasData) {
                        return SizedBox(
                          width: 200,
                          child: DropdownButtonFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            hint: Text('this flore 2'),
                            items: list.map((e) {
                              return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e.floreno),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        );
                      }
                      return Container();
                    },
                  );
                },
              ),
              Consumer<HelperProvider>(
                builder: (context, helper, child) {
                  return StreamBuilder(
                    stream: helper.getroomvaccency('Flore 3'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Floremodel> list = [];

                      list = snapshot.data!.docs.map((e) {
                        return Floremodel.fromjason(
                            e.data() as Map<String, dynamic>);
                      }).toList();

                      if (snapshot.hasData) {
                        return SizedBox(
                          width: 200,
                          child: DropdownButtonFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            hint: Text('this flore 3'),
                            items: list.map((e) {
                              return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e.floreno),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        );
                      }
                      return Container();
                    },
                  );
                },
              ),
              Consumer<HelperProvider>(
                builder: (context, helper, child) {
                  return StreamBuilder(
                    stream: helper.getroomvaccency('Flore 4'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Floremodel> list = [];

                      list = snapshot.data!.docs.map((e) {
                        return Floremodel.fromjason(
                            e.data() as Map<String, dynamic>);
                      }).toList();

                      if (snapshot.hasData) {
                        return SizedBox(
                          width: 200,
                          child: DropdownButtonFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            hint: Text('this flore 4'),
                            items: list.map((e) {
                              return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e.floreno),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        );
                      }
                      return Container();
                    },
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: ResHelper.h(context) * .20,
          ),
          SizedBox(
              width: ResHelper.w(context) * .150,
              child: Consumer<HelperProvider>(
                builder: (context, helper, child) {
                  return DropdownButtonFormField(
                    hint: Text('Select flore'),
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    items: flore.map((e) {
                      return DropdownMenuItem(
                        value: e.toString(),
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (value) {
                      helper.selectflorevacency(value);
                    },
                  );
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: ResHelper.h(context) * .010,
                  ),
                  SizedBox(
                    width: ResHelper.w(context) * .3,
                    height: ResHelper.h(context) * .2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: florenumber,
                      decoration: InputDecoration(
                        hintText: 'Add room number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResHelper.h(context) * .030,
                  ),
                  Consumer<HelperProvider>(
                    builder: (context, helper, child) {
                      return GestureDetector(
                        onTap: () {
                          helper
                              .addRoomvaceny(
                            RoomVacencyModel(
                              vacencyroom: florenumber.text,
                              vecenacyflore:
                                  helper.selectflorevacancy.toString(),
                            ),
                          )
                              .then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminHomePage(),
                                ));
                            cherrytoast(context, 'Add room succes');
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: ResHelper.w(context) * .2,
                          height: ResHelper.h(context) * .070,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              ResHelper.w(context) * .005,
                            ),
                            color: Colors.grey,
                          ),
                          child: Text('Add vacency'),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
