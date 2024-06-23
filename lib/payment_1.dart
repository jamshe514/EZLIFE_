import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/controller/paymentcontroller.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/model/uploadcharge.dart';
import 'package:demo_project/myhomepage.dart';
import 'package:demo_project/payment_2.dart';
import 'package:demo_project/payment_3.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class payment_first extends StatefulWidget {
  const payment_first({super.key});

  @override
  State<payment_first> createState() => _payment_firstState();
}

class _payment_firstState extends State<payment_first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("payment")),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Consumer<HelperProvider>(
              builder: (context, helper, child) {
                return StreamBuilder(
                  stream: helper.getBillAmout(auth.currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    List<UploadCharge> list = [];

                    list = snapshot.data!.docs.map((e) {
                      return UploadCharge.fromjsone(
                          e.data() as Map<String, dynamic>);
                    }).toList();

                    return list.isEmpty
                        ? Center(
                            child: Text('You Bill is Procecing'),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              final total = (list[index].monthlerent +
                                      list[index].utility +
                                      list[index].maintance)
                                  .toString();

                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // height: 150,
                                width: 350,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 180, top: 20),
                                      child: Text(
                                        "Pay Dues",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text(
                                            "Last date:30/2/2024",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Monthly Rent",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Text('=='),
                                        Text(
                                          list[index].monthlerent.toString(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Utility Rent",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Text('=='),
                                        Text(
                                          list[index].utility.toString(),
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Maintance Rent",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Text('=='),
                                        Text(
                                          list[index].maintance.toString(),
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: ResHelper.w(context) * .70,
                                          ),
                                          child: Text(
                                            total,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: ResHelper.h(context) * .020,
                              );
                            },
                          );
                  },
                );
              },
            ),
            SizedBox(
              height: ResHelper.h(context) * .20,
            ),
            FutureBuilder(
              future: PaymentController().appopen(),
              builder: (context, snapshot) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(snapshot.data!.name.toString()),
                );
              },
            ),
            GestureDetector(
              onTap: () async {
                // await PaymentController().appopen().then((value) async {
                //   var transaction = await PaymentController()
                //       .initiateTransaction(amout: 10, recivername: 'fayis')
                //       .then((value) {});

                // });
                await PaymentController().appopen().then((value) async {
                  var transaction = await PaymentController()
                      .initiateTransaction(amout: 10, recivername: 'ezlife')
                      .then((value) {
                    // final statu =
                    //     value.status == UpiPaymentStatus.SUCCESS;
                  });
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: ResHelper.w(context) * .40,
                height: ResHelper.h(context) * .080,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ResHelper.w(context) * .010),
                  border: Border.all(),
                  color: Colors.blueGrey,
                ),
                child: Text(
                  'PAYMENT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
