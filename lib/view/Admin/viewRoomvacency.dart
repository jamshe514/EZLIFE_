import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/model/flore_model.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomVaccency extends StatelessWidget {
  const RoomVaccency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/single flore.jpg'))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SELECTED ROOM VACCENCY REPORT',
                  style: TextStyle(
                    fontSize: ResHelper.w(context) * .030,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: ResHelper.h(context) * .40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<HelperProvider>(
                  builder: (context, helper, child) {
                    return StreamBuilder(
                      stream: helper.getroomvaccency('Floor 1'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<Floremodel> list = [];

                        list = snapshot.data!.docs.map((e) {
                          return Floremodel.fromjason(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        if (snapshot.hasData) {
                          return SizedBox(
                            width: 200,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.blueGrey,
                                  filled: true,
                                  border: OutlineInputBorder()),
                              hint: Text(
                                ' Floor 1',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              items: list.map((e) {
                                return DropdownMenuItem(
                                  value: e.toString(),
                                  child: Text(e.floreno),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
                Consumer<HelperProvider>(
                  builder: (context, helper, child) {
                    return StreamBuilder(
                      stream: helper.getroomvaccency('Floor 2'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<Floremodel> list = [];

                        list = snapshot.data!.docs.map((e) {
                          return Floremodel.fromjason(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        if (snapshot.hasData) {
                          return SizedBox(
                            width: 200,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.blueGrey,
                                  filled: true,
                                  border: OutlineInputBorder()),
                              hint: Text(
                                '  Floor 2',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              items: list.map((e) {
                                return DropdownMenuItem(
                                  value: e.toString(),
                                  child: Text(e.floreno),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
                Consumer<HelperProvider>(
                  builder: (context, helper, child) {
                    return StreamBuilder(
                      stream: helper.getroomvaccency('Floor 3'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<Floremodel> list = [];

                        list = snapshot.data!.docs.map((e) {
                          return Floremodel.fromjason(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        if (snapshot.hasData) {
                          return SizedBox(
                            width: 200,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.blueGrey,
                                  filled: true,
                                  border: OutlineInputBorder()),
                              hint: Text(
                                '  Floor 3',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              items: list.map((e) {
                                return DropdownMenuItem(
                                  value: e.toString(),
                                  child: Text(e.floreno),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
                Consumer<HelperProvider>(
                  builder: (context, helper, child) {
                    return StreamBuilder(
                      stream: helper.getroomvaccency('Floor 4'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<Floremodel> list = [];

                        list = snapshot.data!.docs.map((e) {
                          return Floremodel.fromjason(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        if (snapshot.hasData) {
                          return SizedBox(
                            width: 200,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.blueGrey,
                                  filled: true,
                                  border: OutlineInputBorder()),
                              hint: Text(
                                '  floor 4',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              items: list.map((e) {
                                return DropdownMenuItem(
                                  value: e.toString(),
                                  child: Text(e.floreno),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          );
                        }
                        return Container();
                      },
                    );
                  },
                )
              ],
            ),
            SizedBox(
              height: ResHelper.h(context) * .20,
            ),
          ],
        ),
      ),
    );
  }
}
