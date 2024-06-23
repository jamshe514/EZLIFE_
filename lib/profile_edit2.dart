//import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class profile_edit1 extends StatefulWidget {
  const profile_edit1({super.key});

  @override
  State<profile_edit1> createState() => _profile_editState();
}


class _profile_editState extends State<profile_edit1> {
  final _formkey = GlobalKey<FormState>();
  final namecontrooler = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final roomnocontroller = TextEditingController();
   

    
 


  @override
  Widget build(BuildContext context) {
    //String id = auth.currentUser!.uid;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("profile edit ")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 65,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: namecontrooler,
                      decoration: InputDecoration(
                          labelText: "Name",
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.person_rounded)),
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return " please the username";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: phonecontroller,
                      decoration: InputDecoration(
                          labelText: "phone",
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.phone)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please the phone";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: phonecontroller,
                      decoration: InputDecoration(
                          labelText: "Room no",
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.location_city)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please the phone";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          labelText: "Email",
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please the Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.cyan)),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => profile_edit1(),
                                  ));
                            }
                          },
                          child: Text("Ok")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
