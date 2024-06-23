import 'package:demo_project/view/users/swimpoolbook.dart';
import 'package:demo_project/gasthouse.dart';
import 'package:demo_project/gym.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/party.dart';
import 'package:demo_project/turaf.dart';
import 'package:flutter/material.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Booking")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // width: double.infinity,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 45,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         filled: true,
                  //         fillColor: Colors.white,
                  //         hintText: "search",
                  //         prefixIcon: Icon(Icons.search),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //         )),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images (21).jpeg"),
                            radius: 30,
                          ),
                          Text(
                            "Party Hall",
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.cyan)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              bookingpageparty()));
                                },
                                child: Text("Book")),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/download (9).jpg"),
                            radius: 30,
                          ),
                          Text(
                            "Swimming Pool",
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.cyan)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => bookingpage()));
                                },
                                child: Text("Book")),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/truf.jpeg"),
                            radius: 30,
                          ),
                          Text(
                            "Turaf",
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.cyan)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              bookingpagetruf()));
                                },
                                child: Text("Book")),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/house.jpeg"),
                            radius: 30,
                          ),
                          Text(
                            "Guest House",
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.cyan)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              bookingpagegast()));
                                },
                                child: Text("Book")),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/gym.jpeg"),
                            radius: 30,
                          ),
                          Text(
                            "gym",
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.cyan)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              bookingpagegym()));
                                },
                                child: Text("Book")),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
