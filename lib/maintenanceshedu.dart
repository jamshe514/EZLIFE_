import 'package:flutter/material.dart';

class mainschedule extends StatefulWidget {
  const mainschedule({super.key});

  @override
  State<mainschedule> createState() => _mainscheduleState();
}

class _mainscheduleState extends State<mainschedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Booking")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: Container(
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
              SizedBox(
                height: 40,
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Unit No",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 120,
                width: 320,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 200,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text("pluming issue", style: TextStyle(fontSize: 18)),
                        Text("22/12/2024", style: TextStyle(fontSize: 18)),
                        Text("unit no:c-404 ", style: TextStyle(fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text("pending ",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.red)),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
