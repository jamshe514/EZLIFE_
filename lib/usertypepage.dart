import 'package:demo_project/home_user.dart';
import 'package:flutter/material.dart';

class usertype extends StatefulWidget {
  const usertype({super.key});

  @override
  State<usertype> createState() => _usertypeState();
}

class _usertypeState extends State<usertype> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/bg.jpg",
            ),
          )),
          child: Padding(
            padding: const EdgeInsets.only(right: 2, top: 80),
            child: Column(children: [
              const Text(
                "User Type",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 2),
                child: Center(
                  child: SizedBox(
                    height: 50,
                    child: SizedBox(
                      width: 300,
                      height: 12,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField(
                            value: -1,
                            items: [
                              //  DropdownMenuItem(
                              //  child: Text("selected user type"),
                              ////   value: -1,
                              // ),
                              DropdownMenuItem(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              home_user()));
                                },
                                child: Text(
                                  "Residents",
                                  style: TextStyle(fontSize: 20),
                                ),
                                value: -1,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Security",
                                  style: TextStyle(fontSize: 20),
                                ),
                                value: 1,
                              ),
                            ],
                            onChanged: (v) {}),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
