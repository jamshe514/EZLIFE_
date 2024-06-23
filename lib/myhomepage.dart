import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Hii",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("hii"),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "email",
                    hintText: "email",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                  decoration: InputDecoration(
                      labelText: "password",
                      hintText: "passworld",
                      border: OutlineInputBorder())),
            ],
          ),
        ),
      ),
    );
  }
}
