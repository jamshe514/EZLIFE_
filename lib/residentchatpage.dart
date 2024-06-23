import 'package:flutter/material.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smith"),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: CircleAvatar(),
        ),
        actions: [
          Icon(
            Icons.call,
            size: 35,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.video_call,
            size: 45,
          )
        ],
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter The Message",
            prefixIcon: Icon(Icons.messenger_outline),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.send),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
