import 'package:demo_project/model/feedback.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final feedbackcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("feedback")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
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
              Text(
                "Feedback:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: feedbackcontroller,
                maxLines: 6,
                decoration: InputDecoration(
                  filled: true,

                  // labelText: "Name",
                  hintText: "Type a feedback",
                  // prefixIcon: Icon(Icons.person),
                  fillColor: Color(0xFFF3EEEE),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 100,
                  height: 40,
                  child: Consumer<HelperProvider>(
                    builder: (context, helper, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 12, 184, 193)),
                        onPressed: () {
                          helper
                              .addfeedback(
                            feedbackuser(
                              msg: feedbackcontroller.text,
                              uid: auth.currentUser!.uid,
                            ),
                          )
                              .then((value) {
                            clear();
                            cherrytoast(context, 'add feedback');
                          });
                        },
                        child: Text(
                          "feedback",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ));
  }

  clear() {
    feedbackcontroller.clear();
  }
}
