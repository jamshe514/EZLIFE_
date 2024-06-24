import 'package:demo_project/collections/controler.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bookingsheduledturaf extends StatefulWidget {
  const bookingsheduledturaf({super.key});

  @override
  State<bookingsheduledturaf> createState() => _bookingsheduleState();
}

class _bookingsheduleState extends State<bookingsheduledturaf> {
  Controller controller = Controller();
  HelperProvider helperProvider = HelperProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Sloot Time",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  controller.searchturf(value);
                },
                onTap: () {
                  controller.turfget();
                },
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder(
                      future: controller.turfget(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final data = controller.turfall;

                        final allsear = controller.turfsearch.isEmpty
                            ? data
                            : controller.turfsearch;

                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            controller.turfall.isEmpty
                                ? Center(
                                    child: Text('NO SLOT BOOKED'),
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: allsear.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        // height: 200,
                                        // width: 320,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: 200,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 6),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Room no :${allsear[index].RoomeNo}",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Text(
                                                    "Date:${allsear[index].Date}",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Text("To:${allsear[index].to}",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Text(
                                                    "Flore:${allsear[index].selecflore}",
                                                    style:
                                                        TextStyle(fontSize: 18))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 50,
                                      );
                                    },
                                  )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}
