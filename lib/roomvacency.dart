import 'dart:developer';

import 'package:demo_project/model/Roomvacency.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Roomvacency extends StatelessWidget {
  const Roomvacency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room vaccency'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResHelper.w(context) * .050,
        ),
        child: Consumer<HelperProvider>(
          builder: (context, helper, child) {
            return StreamBuilder(
              stream: helper.getvaccency(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<RoomVacencyModel> list = [];

                list = snapshot.data!.docs.map((e) {
                  return RoomVacencyModel.fromjsone(
                      e.data() as Map<String, dynamic>);
                }).toList();

                if (snapshot.hasData) {
                  return list.isEmpty
                      ? Center(
                          child: Text('No room '),
                        )
                      : ListView.separated(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Material(
                              elevation: 4,
                              child: Container(
                                height: ResHelper.h(context) * .080,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        'FLORE NO :${list[index].vecenacyflore}'),
                                    Text('ROOM NO :${list[index].vacencyroom}'),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: ResHelper.h(context) * .020,
                            );
                          },
                        );
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
