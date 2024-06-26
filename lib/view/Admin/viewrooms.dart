import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/model/flore_model.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ViewRoom extends StatelessWidget {
  const ViewRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<HelperProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('FLOOR NO 1'),
                Text('FLOOR NO 2'),
                Text('FLOOR NO 3'),
                Text('FLOOR NO 4'),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: helper.getroomvaccency('Floor 1'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        List<Floremodel> list = snapshot.data!.docs.map((e) {
                          return Floremodel.fromjason(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        return ListView.builder(
                          itemCount: 50,  
                          itemBuilder: (context, index) {
                            if (index < list.length) {
                            
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResHelper.w(context) * .010),
                                    color: Colors.red,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('FLOOR :${list[index].Flore}'),
                                      Text('ROOM NO:${list[index].floreno}'),
                                      Text('ALREADY BOOKED')
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // If index is out of range, display placeholder content
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResHelper.w(context) * .010),
                                    color: Colors.green,
                                  ), // Placeholder color
                                  child: Column(
                                    children: [
                                      Text('Vacency'),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: helper.getroomvaccency('Floor 2'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        List<Floremodel> list = snapshot.data!.docs.map((e) {
                          return Floremodel.fromjason(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        return ListView.builder(
                          itemCount: 50, // Always display 50 items
                          itemBuilder: (context, index) {
                            if (index < list.length) {
                              // If index is within the range of available data
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResHelper.w(context) * .010),
                                    color: Colors.red,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('FLOOR :${list[index].Flore}'),
                                      Text('ROOM NO:${list[index].floreno}'),
                                      Text('ALREADY BOOKED')
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // If index is out of range, display placeholder content
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResHelper.w(context) * .010),
                                    color: Colors.green,
                                  ), // Placeholder color
                                  child: Column(
                                    children: [
                                      Text('Vacency'),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: helper.getroomvaccency('Floor 3'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        List<Floremodel> list = snapshot.data!.docs.map((e) {
                          return Floremodel.fromjason(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        return ListView.builder(
                          itemCount: 50, // Always display 50 items
                          itemBuilder: (context, index) {
                            if (index < list.length) {
                              // If index is within the range of available data
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResHelper.w(context) * .010),
                                    color: Colors.red,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('FLOOR :${list[index].Flore}'),
                                      Text('ROOM NO:${list[index].floreno}'),
                                      Text('ALREADY BOOKED')
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // If index is out of range, display placeholder content
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResHelper.w(context) * .010),
                                    color: Colors.green,
                                  ), // Placeholder color
                                  child: Column(
                                    children: [
                                      Text('Vacency'),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: helper.getroomvaccency('Floor 4'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        List<Floremodel> list = snapshot.data!.docs.map((e) {
                          return Floremodel.fromjason(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        return ListView.builder(
                          itemCount: 50, // Always display 50 items
                          itemBuilder: (context, index) {
                            if (index < list.length) {
                              // If index is within the range of available data
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResHelper.w(context) * .010),
                                    color: Colors.red,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('FLOOR :${list[index].Flore}'),
                                      Text('ROOM NO:${list[index].floreno}'),
                                      Text('ALREADY BOOKED')
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // If index is out of range, display placeholder content
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResHelper.w(context) * .010),
                                    color: Colors.green,
                                  ), // Placeholder color
                                  child: Column(
                                    children: [
                                      Text('Vacency'),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
