import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/model/maintenance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Maintaine extends StatelessWidget {
  const Maintaine({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .040,
          ),
          child: Consumer<HelperProvider>(
            builder: (context, helper, child) {
              return StreamBuilder(
                stream: helper.getMaintaines(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<MaintenanceModel> list = [];

                  list = snapshot.data!.docs.map((e) {
                    return MaintenanceModel.fromjson(
                        e.data() as Map<String, dynamic>);
                  }).toList();

                  if (snapshot.hasData) {
                    return list.isEmpty
                        ? Center(
                            child: Text('No visitore'),
                          )
                        : ListView.separated(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(
                                    width * .020,
                                  ),
                                ),
                                width: width * .50,
                                // height: height * .35,
                                // color: Colors.purple,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * .020,
                                    vertical: width * .020,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('ROOM NO:${list[index].RoomNo}'),
                                      Text('FLORE NO :${list[index].flore}'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Issuetype:${list[index].complainttype}',
                                            style: TextStyle(
                                              fontSize: width * .050,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * .250,
                                            height: height * .250,
                                            child: Image.network(
                                              list[index].image,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index].description,
                                            style: TextStyle(
                                              fontSize: width * .020,
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                  list[index].maintainestatus))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: height * .10,
                              );
                            },
                          );
                  }
                  return Container();
                },
              );
            },
          )),
    );
  }
}
