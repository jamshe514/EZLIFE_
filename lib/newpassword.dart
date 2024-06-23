import 'package:demo_project/successfully.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Newpass extends StatefulWidget {
  const Newpass({super.key});

  @override
  State<Newpass> createState() => _NewpassState();
}

class _NewpassState extends State<Newpass> {
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
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    "New Password",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text(
                    "Enter the new password:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        //labelText: "password",
                        //hintText: " password",
                        fillColor: Color(0xFFF3EEEE),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        suffixIcon: Icon(Icons.remove_red_eye)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text(
                    "Enter the new password:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        //labelText: "password",
                        //hintText: " password",
                        fillColor: Color(0xFFF3EEEE),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        suffixIcon: Icon(Icons.remove_red_eye)),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 12, 184, 193)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => success()));
                    },
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            )));
  }
}
