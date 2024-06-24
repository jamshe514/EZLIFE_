import 'package:demo_project/collections/controler.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BokkingDetails extends StatelessWidget {
  const BokkingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('PARTY DETAILS'),
            Consumer<Controller>(
              builder: (context, control, child) {
                return FutureBuilder(
                  future: control.bookingdet(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final data = control.bookModel;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: ResHelper.h(context) * .120,
                                color: Colors.blueGrey,
                                child: Column(
                                  children: [
                                    Text('SHEDUALED DATE :${data[index].Date}'),
                                    Text('ROOM NO :${data[index].RoomeNo}'),
                                    Text('FLORE NO :${data[index].selecflore}'),
                                    Text('SLOOT TIME : ${data[index].to}'),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: ResHelper.h(context) * .050,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: ResHelper.h(context) * .030,
            ),
            Text('SWIMMING POOL DETAILS'),
            Consumer<Controller>(
              builder: (context, control, child) {
                return FutureBuilder(
                  future: control.swimallget(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    final data = control.swimall;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: ResHelper.h(context) * .120,
                            color: Colors.blueGrey,
                            child: Column(
                              children: [
                                Text('SCHEDULED DATE: ${data[index].Date}'),
                                Text('ROOM NO: ${data[index].RoomeNo}'),
                                Text('FLOOR NO: ${data[index].selecflore}'),
                                Text('SLOT TIME: ${data[index].to}'),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: ResHelper.h(context) * .050,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: ResHelper.h(context) * .030,
            ),
            Text('TURF'),
            Consumer<Controller>(
              builder: (context, control, child) {
                return FutureBuilder(
                  future: control.turfget(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final data = control.turfall;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: ResHelper.h(context) * .120,
                                color: Colors.blueGrey,
                                child: Column(
                                  children: [
                                    Text('SHEDUALED DATE :${data[index].Date}'),
                                    Text('ROOM NO :${data[index].RoomeNo}'),
                                    Text('FLORE NO :${data[index].selecflore}'),
                                    Text('SLOOT TIME : ${data[index].to}'),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: ResHelper.h(context) * .050,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: ResHelper.h(context) * .030,
            ),
          ],
        ),
      ),
    );
  }
}
