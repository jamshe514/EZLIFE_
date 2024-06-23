import 'package:demo_project/collections/controler.dart';
import 'package:demo_project/model/activitymodel.dart';
import 'package:demo_project/utils/string.dart';
import 'package:demo_project/view/users/activites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class add_activites extends StatefulWidget {
  const add_activites({super.key});

  @override
  State<add_activites> createState() => _add_activitesState();
}

class _add_activitesState extends State<add_activites> {
  final activitynamecontroller = TextEditingController();
  final golascontroller = TextEditingController();
  final venuecontroller = TextEditingController();
  TimeOfDay? _selectedTime;
  TimeOfDay? _selectedEndTime;

  Future<void> showStartTimePicker() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Future<void> showEndTimePicker() async {
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedEndTime != null) {
      setState(() {
        _selectedEndTime = pickedEndTime;
      });
    }
  }

  //final db = FirebaseFirestore.instance;

  DateTime selecdate = DateTime.now();
  TimeOfDay? _selectedend;

  Future<void> timepickerto() async {
    TimeOfDay? pickedFile =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    setState(() {
      _selectedend = pickedFile;
    });
  }

  DateTime selecdated = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Add Activites")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 700,
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
                TextFormField(
                  controller: activitynamecontroller,
                  decoration: InputDecoration(
                    filled: true,
                    // labelText: "Name",
                    hintText: " Activity Name",
                    // prefixIcon: Icon(Icons.person),
                    fillColor: Color(0xFFF3EEEE),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: venuecontroller,
                  decoration: InputDecoration(
                    filled: true,
                    // labelText: "Name",
                    hintText: " venue",
                    // prefixIcon: Icon(Icons.person),
                    fillColor: Color(0xFFF3EEEE),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: TextField(
                    controller: golascontroller,
                    maxLines: 6,
                    decoration: InputDecoration(
                      filled: true,
                      // labelText: "Name",
                      hintText: " Activity Goals ",
                      // prefixIcon: Icon(Icons.person),
                      fillColor: Color(0xFFF3EEEE),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text(
                    "Time:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: SizedBox(
                        height: 39,
                        width: 120,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: _selectedTime != null
                                ? _selectedTime!.format(context)
                                : "From",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.timer_outlined),
                              onPressed: () async {
                                await showStartTimePicker();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: SizedBox(
                        height: 39,
                        width: 120,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: _selectedEndTime != null
                                ? _selectedEndTime!.format(context)
                                : "To",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.timer_outlined),
                              onPressed: () async {
                                await showEndTimePicker();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          // filled: true,
                          hintText: selecdate != null
                              ? "${selecdate!.day}/${selecdate!.month}/${selecdate!.year}"
                              : "Date",
                          // hintText: " Name",
                          // prefixIcon: Icon(Icons.person),
                          // fillColor: Color(0xFFF3EEEE),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                final DateTime? date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(3000));

                                if (selecdate != null) {
                                  setState(() {
                                    selecdate = date!;
                                  });
                                }
                              },
                              icon: Icon(Icons.date_range))),
                    ),
                  ),
                ),

                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 12, 184, 193)),
                    onPressed: () async {
                      
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(selecdate);

                      if (_selectedTime != null && _selectedEndTime != null) {
                        await Controller().addactivites(ActivityModel(
                          Activity_name: activitynamecontroller.text,
                          Activiy_Goals: golascontroller.text,
                          Venue: venuecontroller.text,
                          From: _selectedTime!.format(context),
                          to: _selectedEndTime!.format(context),
                          Date: formattedDate,
                        ));
                        cherrytoast(context, 'add Activites ');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Activityadd()),
                        );

                        clear();
                      } else {
                        print(
                            '------------------------------------------------------error mone -------------------------------------');
                      }

                      print(
                          '----------------${_selectedTime!.format(context)}==========================================');
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                //fileimage == null ? Text("loading") : Image.file(fileimage!)
              ],
            ),
          ),
        ));
  }

  void clear() {}
}
