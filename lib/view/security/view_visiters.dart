import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/model/guestmodel.dart';
import 'package:demo_project/view/users/addvisiterspage.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/parcel.dart';
import 'package:demo_project/view/security/outside_visitor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class visitors_view extends StatefulWidget {
  const visitors_view({super.key});

  @override
  State<visitors_view> createState() => _visitorsState();
}

class _visitorsState extends State<visitors_view> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("view visitores")),
            backgroundColor: Color.fromARGB(44, 24, 255, 216),
            bottom: TabBar(
              tabs: [
                Tab(text: ""),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Consumer<HelperProvider>(
                    builder: (context, instance, child) {
                      return StreamBuilder(
                        stream: instance.getGustall(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<GuestModel> guest = [];

                          guest = snapshot.data!.docs.map((e) {
                            return GuestModel.fromjsone(
                                e.data() as Map<String, dynamic>);
                          }).toList();

                          if (snapshot.hasData) {
                            return guest.isEmpty
                                ? Center(
                                    child: Text('No visitors'),
                                  )
                                : ListView.builder(
                                    itemCount: guest.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Card(
                                          child: Container(
                                            width: double.infinity,
                                            height: 100,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                guest[index]
                                                                    .image))),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 17.0, left: 10),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          'GUESTNAME:${guest[index].guestname}'),
                                                      Text(
                                                          'NO:${guest[index].roomnumber}'),
                                                      Text(
                                                        'FLOOR NO:${guest[index].florenumber}',
                                                      ),
                                                      // Text(
                                                      //   guest[index].date,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: SizedBox(
                                                    // width: 70,
                                                    height: 40,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Color
                                                                        .fromARGB(
                                                                  255,
                                                                  54,
                                                                  241,
                                                                  44,
                                                                ),
                                                                foregroundColor:
                                                                    Colors
                                                                        .black,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .zero)),
                                                        onPressed: () {},
                                                        child: Text(
                                                          guest[index].status,
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                          }
                          return Container();
                        },
                      );
                    },
                  )),
            ],
          )),
    );
  }
}
