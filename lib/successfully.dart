import 'package:demo_project/authentication/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _sucessState();
}

class _sucessState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Text(
                  "Change Successfully",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Image.asset(
                "assets/pngtree.png",
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150, top: 30),
                child: Text(
                  "Let Go login",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => loginPage()));
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Icon(
          Icons.arrow_forward,
          size: 50,
        ),
      ),
    );
  }
}
