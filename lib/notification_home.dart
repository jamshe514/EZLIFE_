import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Notification")),
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
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  width: 350,
                  child: Row(children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    Text("Joss "),
                    Text("A-101"),
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.chat_outlined)),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
