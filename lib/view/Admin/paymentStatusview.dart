import 'dart:math';

import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/model/Bookingupdates.dart';
import 'package:demo_project/model/usermodel.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentStatusView extends StatelessWidget {
  const PaymentStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: ResHelper.h(context) * .050,
          ),
          Consumer<HelperProvider>(
            builder: (context, helper, child) {
              return StreamBuilder(
                stream: helper.getPyamentstatus(),
                builder: (context, snapshot) {
                  List<Paymentstatus> list = [];

                  list = snapshot.data!.docs.map((e) {
                    return Paymentstatus.fromJsone(
                        e.data() as Map<String, dynamic>);
                  }).toList();

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResHelper.w(context) * .150,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        final uid = list[index].uid;

                        final data =
                            db.collection('Register').doc(uid).snapshots();
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          width: ResHelper.w(context) * .120,
                          height: ResHelper.h(context) * .200,
                          child: Column(
                            children: [
                              Text(list[index].name),
                              Text(list[index].status),
                              Text(list[index].date),
                              StreamBuilder(
                                stream: data,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  }
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        Text(
                                            'USER FLOOR : ${snapshot.data!['flore']}'),
                                        Text(
                                            'USER ROOMNUMBER : ${snapshot.data!['roomnumber']}'),
                                      ],
                                    );
                                  }
                                  return Container();
                                },
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: ResHelper.h(context) * .030,
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
