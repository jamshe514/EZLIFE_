import 'dart:math';

import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/model/panicalert.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PanicAlertHome extends StatelessWidget {
  const PanicAlertHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panic Alert'),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<HelperProvider>(
            builder: (context, helper, child) {
              return StreamBuilder(
                stream: helper.getAlert(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<PanicAlert> list = [];

                  list = snapshot.data!.docs.map((e) {
                    return PanicAlert.fromjsone(
                        e.data() as Map<String, dynamic>);
                  }).toList();

                  if (snapshot.hasData) {
                    return list.isEmpty
                        ? Center(
                            child: Text('No alert'),
                          )
                        : GridView.builder(
                            itemCount: list.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              final docid = list[index].uid;
                              final data = db
                                  .collection('Register')
                                  .doc(docid)
                                  .snapshots();
                              return Container(
                                width: 60,
                                // height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Text(
                                            list[index].description,
                                          ),
                                          // SizedBox(
                                          //   height: 20,
                                          // ),
                                          StreamBuilder(
                                            stream: data,
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              }
                                              var data = snapshot.data!.data()
                                                  as Map<String, dynamic>;
                                              return Column(
                                                children: [
                                                  Text(
                                                    'RoomNo: ${data['roomnumber']}',
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'FLore: ${data['flore']}',
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Name: ${data['username']}',
                                                  ),
                                                ],
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                  }
                  return Container();
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
