import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/authentication/login.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/view/security/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class securitysingup extends StatefulWidget {
  securitysingup({super.key});

  @override
  State<securitysingup> createState() => _signupState();
}

File? SelectedImage;

class _signupState extends State<securitysingup> {
  final _auth = FirebaseAuth.instance;
  String email = "", password = "";
  String? url;
  Future<void> addfirebase(
      Map<String, dynamic> registereduserinfomap, String userid) async {
    try {
      await FirebaseFirestore.instance
          .collection("Register")
          .doc(userid)
          .set(registereduserinfomap);
    } catch (e) {
      print(" error adding document:$e");
      throw e;
    }
  }

  String? _validateemail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'please the valid email';
    }
    return null;}

  Registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("registration sucess"),
        ));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => bottomnavipage(
              indexnum: 0,
            ),
          ),
        );
        // String registeredUserId = randomString(10);
        String uid = _auth.currentUser!.uid;
        Map<String, dynamic> registereduserinfomap = {
          "username": usernamecontroller.text,
          "email": emailcontroller.text,
          "phone": phonecontroller.text,
          "age": agecontrooler.text,
          "id": uid,
          'imageurl': url
        };
        await addfirebase(registereduserinfomap, uid);
        const SnackBar(content: Text("detals added to firebase successfully"));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("weak password"),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(" email address already used"),
            ),
          );
        }
      }
    }
  }

  final _formkey = GlobalKey<FormState>();
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  final agecontrooler = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final conpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _pickedimagegallery() async {
      final pickedimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedimage == null) return;
      setState(() {
        SelectedImage = File(pickedimage.path);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginPage()));
              },
              icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              height: 800,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.grey),
                            ),
                            child: Positioned(
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: SelectedImage != null
                                            ? FileImage(SelectedImage!)
                                            : AssetImage('assets/profile.png')
                                                as ImageProvider<Object>),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4, color: Colors.grey)),
                                child: IconButton(
                                    onPressed: () async {
                                      _pickedimagegallery().then((value) async {
                                        SettableMetadata metadata =
                                            SettableMetadata(
                                                contentType: 'profile/jpeg');
                                        final currenttime = TimeOfDay.now();
                                        UploadTask uploadTask = FirebaseStorage
                                            .instance
                                            .ref()
                                            .child('shopimage/shop$currenttime')
                                            .putFile(SelectedImage!, metadata);
                                        TaskSnapshot snapshot =
                                            await uploadTask;

                                        await snapshot.ref
                                            .getDownloadURL()
                                            .then((url) {
                                          log('image path $url');

                                          setState(() {
                                            this.url = url;
                                          });
                                        });
                                      });
                                    },
                                    icon: Icon(Icons.camera_alt_outlined)),
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: usernamecontroller,
                            decoration: InputDecoration(
                                labelText: "Name",
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.person_rounded)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please the username";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  alignLabelWithHint: true,
                                  prefixIcon: Icon(Icons.email)),
                              validator: _validateemail),
                              TextFormField(
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: usernamecontroller,
                            decoration: InputDecoration(
                                labelText: "age",
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.person_rounded)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please the age";
                              }
                              return null;
                            },
                          ),
                         
                          
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: phonecontroller,
                            decoration: InputDecoration(
                              labelText: "Phone No",
                              alignLabelWithHint: true,
                              prefixIcon: Icon(Icons.phone),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please the  Phone no";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                labelText: " passsword",
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: Icon(Icons.remove_red_eye_rounded)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please the password";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: conpasswordcontroller,
                            decoration: InputDecoration(
                                labelText: " confirm password",
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: Icon(Icons.remove_red_eye_rounded)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please the confirm password";
                              }
                              if ((passwordcontroller.text !=
                                  conpasswordcontroller.text)) {
                                return 'password do not match';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: SizedBox(
                              height: 45,
                              width: 160,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: (Color(0xFF27ABC2)),
                                    foregroundColor: (Colors.black)),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = emailcontroller.text;
                                      password = passwordcontroller.text;
                                    });
                                    Registration();
                                  }
                                },
                                child: Text("sumbit"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
