import 'package:flutter/material.dart';

class visitorsviwe extends StatefulWidget {
  const visitorsviwe({super.key});

  @override
  State<visitorsviwe> createState() => _visitorsviweState();
}

class _visitorsviweState extends State<visitorsviwe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Gate Updates")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      "Name:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        decoration: InputDecoration(
                      fillColor: (Colors.white),
                      border: OutlineInputBorder(),
                      //  labelText: 'View Data',
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      "Phone:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        decoration: InputDecoration(
                      fillColor: (Colors.white),
                      border: OutlineInputBorder(),
                      //  labelText: 'View Data',
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      "Vehicle:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        decoration: InputDecoration(
                      fillColor: (Colors.white),
                      border: OutlineInputBorder(),
                      //  labelText: 'View Data',
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      "No Of pepoles:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        decoration: InputDecoration(
                      fillColor: (Colors.white),
                      border: OutlineInputBorder(),
                      //  labelText: 'View Data',
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      "Time:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                        decoration: InputDecoration(
                      fillColor: (Colors.white),
                      border: OutlineInputBorder(),
                      //  labelText: 'View Data',
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 110,
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.black),
                                  onPressed: () {},
                                  child: Text("Approved")),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 110,
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.black),
                                  onPressed: () {},
                                  child: Text("Rejected")),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
