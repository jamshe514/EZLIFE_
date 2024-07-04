import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:demo_project/view/Admin/home.dart';
import 'package:demo_project/model/Roomvacency.dart';
import 'package:demo_project/model/flore_model.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Uploadvaccency extends StatelessWidget {
  Uploadvaccency({super.key});

  final florenumber = TextEditingController();

  final formkey = GlobalKey<FormState>();

  final flore = {
    'Floor 1',
    'Floor 2',
    'Floor 3',
    'Floor 4',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/floreimg.webp'),
          ),
        ),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: ResHelper.h(context) * .050,
              ),
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
                height: ResHelper.h(context) * .050,
              ),
              SizedBox(
                  width: ResHelper.w(context) * .150,
                  child: Consumer<HelperProvider>(
                    builder: (context, helper, child) {
                      return DropdownButtonFormField(
                        hint: Text('Select flore'),
                        decoration: InputDecoration(
                            fillColor: Colors.blueGrey,
                            filled: true,
                            border: OutlineInputBorder()),
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
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2)
                          ],
                          keyboardType: TextInputType.number,
                          controller: florenumber,
                          decoration: InputDecoration(
                            fillColor: Colors.blueGrey,
                            filled: true,
                            hintText: 'Add room number',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'requred';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: ResHelper.h(context) * .030,
                      ),
                      Consumer<HelperProvider>(
                        builder: (context, helper, child) {
                          return GestureDetector(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
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
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('requred field')));
                              }
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
        ),
      ),
    );
  }
}
