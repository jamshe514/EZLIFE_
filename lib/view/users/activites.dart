import 'package:demo_project/view/users/addactivites.dart';
import 'package:demo_project/collections/controler.dart';
import 'package:demo_project/model/activitymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Activityadd extends StatefulWidget {
  const Activityadd({super.key});

  @override
  State<Activityadd> createState() => _bookingsheduleState();
}

class _bookingsheduleState extends State<Activityadd> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    final searchcontrooler = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Activites")),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
        actions: [
          Text(
            "Add",
            style: TextStyle(fontSize: 20),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => add_activites()));
              },
              icon: Icon(
                Icons.add,
                size: 40,
              ))
        ],
      ),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Activity Name",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: () {
                    searchcontrooler.adddet();
                  },
                  onChanged: (value) {
                    searchcontrooler.searchActivities(value);
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: FutureBuilder(
                  future: controller.adddet(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<ActivityModel> data = [];
                    // setState(() {
                    data = controller.activityModel;
                    // });

                    final list = searchcontrooler.activitysearch.isEmpty
                        ? controller.activityModel
                        : searchcontrooler.activitysearch;

                    return list.isEmpty
                        ? Center(
                            child: Text("No Data"),
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 20,
                                  ),
                                  itemCount: list.length,
                                  // shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // height: 200,
                                      width: 320,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: 100,
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
                                                  "Activity name:${data![index].Activity_name}",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              Text(
                                                  "Activity Gols :${data![index].Activiy_Goals}",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              Text(
                                                  "Venue:${data![index].Venue}",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              Text("DATE:${data![index].Date}",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              Text("From:${data![index].From}",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              Text("To:${data![index].to}",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
