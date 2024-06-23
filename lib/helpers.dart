import 'package:flutter/material.dart';

class helpers extends StatefulWidget {
  const helpers({super.key});

  @override
  State<helpers> createState() => _helpersState();
}

class _helpersState extends State<helpers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: 10,
          ),
          Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Name:arjun"),
                      SizedBox(
                        width: 150,
                      ),
                      TextButton(onPressed: () {}, child: Text("view More"))
                    ],
                  ),
                  Text("Phone No:123435678"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Vehicle No:45F56"),
                  SizedBox(
                    height: 10,
                  ),
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
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
