import 'dart:developer';

import 'package:demo_project/collections/controler.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/selladd.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class buy_sell extends StatefulWidget {
  const buy_sell({super.key});

  @override
  State<buy_sell> createState() => _buy_sellState();
}

class _buy_sellState extends State<buy_sell> {
  void openwhatsapp(String phonenumber, String text) async {
    // const phonenumber = '+919497504365';
    var url =
        'https://api.whatsapp.com/send?phone=$phonenumber/&text=${Uri.encodeComponent(text)}';
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('coulnd note open whastapp$url');
    }
  }

  Stream getuserdetails() {
    return db
        .collection('Register')
        .where('uid', isEqualTo: auth.currentUser!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<HelperProvider>(context, listen: false);
    final controller = Provider.of<Controller>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(" Buy/Sell")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
          actions: [
            Text(
              "Add",
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => selladd()));
                },
                icon: Icon(
                  Icons.add,
                  size: 40,
                ))
          ],
        ),
        body: Container(
          height: 900,
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
              Expanded(child: Consumer<HelperProvider>(
                builder: (context, instance, child) {
                  return StreamBuilder(
                    stream: instance.getAllProduct().asStream(),
                    builder: (context, snapshot) {
                      final data = instance.allproduct;
                      return data.isEmpty
                          ? Center(
                              child: Text('No Product'),
                            )
                          : ListView.separated(
                              itemCount: data.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 30,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 170,
                                    width: 320,
                                    child: Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  'PRODUCT NAME :${data[index].productname}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'PRODUCT PRICE :${data[index].ProdcutPeice}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 60),
                                            child: Row(
                                              children: [
                                                Text('PRODUCT IMAGE'),
                                                Container(
                                                  // width: 150,
                                                  height: 70,
                                                  child: Image.network(
                                                      data[index].Productimage),
                                                ),
                                                Spacer(),
                                                FutureBuilder(
                                                  future: helper.fetchuserdata(
                                                      auth.currentUser!.uid),
                                                  builder: (context, snapshot) {
                                                    final data =
                                                        helper.usermodel;
                                                    return IconButton(
                                                        onPressed: () {
                                                          log(data!
                                                              .phonenumber);
                                                          openwhatsapp(
                                                              data.phonenumber,
                                                              'Hey wel come ezlife');
                                                          // log(helper
                                                          //     .phonecontroller
                                                          //     .text);
                                                        },
                                                        icon: Icon(
                                                          Icons.chat,
                                                          size: 30,
                                                        ));
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                              },
                            );
                    },
                  );
                },
              )),
            ],
          ),
        ));
  }
}
