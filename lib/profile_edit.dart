import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/model/usermodel.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class profile_edit extends StatefulWidget {
  const profile_edit({super.key});

  @override
  State<profile_edit> createState() => _profile_editState();
}

File? SelectedImage;

class _profile_editState extends State<profile_edit> {
  final _formkey = GlobalKey<FormState>();
  final namecontrooler = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final roomnocontroller = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> _pickedimagegallery() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage == null) return;
    setState(() {
      SelectedImage = File(pickedimage.path);
    });
  }

  void _showEditProfileBottomSheet(BuildContext context, usermodel) {
    final phone = TextEditingController();
    final email = TextEditingController();
    final roomno = TextEditingController();

    // name.text = usermodel;
    // phone.text = userphone;
    // email.text = useremail;
    // roomno.text = roomnouser;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) =>
          SingleChildScrollView(child: Consumer<HelperProvider>(
        builder: (context, instance, child) {
          return FutureBuilder(
            future: instance.fetchuserdata(auth.currentUser!.uid),
            builder: (context, snapshot) {
              final datahel = instance.usermodel;

              final name = TextEditingController(text: datahel!.username);
              final phone = TextEditingController(text: datahel.phonenumber);

              final edemail = TextEditingController(text: datahel.email);

              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      TextFormField(
                        controller: edemail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        keyboardType: TextInputType.phone,
                        controller: phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 153, 234, 234))),
                          onPressed: () {
                            log('${datahel.uid}');
                            db.collection('Register').doc(datahel.uid).update({
                              'username': name.text,
                              'phonenumber': phone.text,
                            });
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    String id = auth.currentUser!.uid;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("PROFILE EDIT ")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: Container(
            width: double.infinity,
            height: 700,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Consumer<HelperProvider>(
              builder: (context, helper, child) {
                return FutureBuilder(
                  future: helper.fetchuserdata(auth.currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    // DocumentSnapshot data = snapshot.data!;

                    // String username = data['username'];
                    // String email = data['email'];
                    // String phone = data['phone'];
                    // String room = data['room'];
                    // String imageurl = data['imageurl'];

                    // final data = snapshot.data;

                    final datahel = helper.usermodel;

                    return Form(
                      key: _formkey,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              height: 200,
                              width: double.infinity,
                              // color: Colors.red,
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 70,
                                        backgroundImage: NetworkImage(
                                          datahel!.userprofileimg,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                      left: w * .60,
                                      top: h * .100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(
                                                w * .010)),
                                        width: 40,
                                        height: 40,
                                        child: IconButton(
                                            onPressed: () {
                                              _pickedimagegallery()
                                                  .then((value) async {
                                                SettableMetadata metadata =
                                                    SettableMetadata(
                                                        contentType:
                                                            'profile/jpeg');
                                                final currenttime =
                                                    TimeOfDay.now();
                                                UploadTask uploadTask =
                                                    FirebaseStorage.instance
                                                        .ref()
                                                        .child(
                                                            'shopimage/shop$currenttime')
                                                        .putFile(SelectedImage!,
                                                            metadata);
                                                TaskSnapshot snapshot =
                                                    await uploadTask;

                                                await snapshot.ref
                                                    .getDownloadURL()
                                                    .then((url) {
                                                  log('image path $url');
                                                  FirebaseFirestore.instance
                                                      .collection('Register')
                                                      .doc(id)
                                                      .update({
                                                    'imageurl': url,
                                                  });
                                                });
                                              });
                                            },
                                            icon: Icon(
                                                Icons.camera_alt_outlined)),
                                      ))
                                ],
                              )),
                          SizedBox(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 100,
                                width: 380,
                                child: Row(
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(datahel.username)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 100,
                                width: 380,
                                child: Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(datahel.phonenumber)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 100,
                                width: 380,
                                child: Row(
                                  children: [
                                    Icon(Icons.location_city_rounded),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(datahel.rooomnumber)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 100,
                                width: 380,
                                child: Row(
                                  children: [
                                    Icon(Icons.location_city_rounded),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(datahel.florenumber)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 100,
                                width: 380,
                                child: Row(
                                  children: [
                                    Icon(Icons.email),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(datahel.email)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.cyan)),
                                onPressed: () {
                                  _showEditProfileBottomSheet(
                                      context, helper.usermodel);

                                  // log('user name ${data['username']}');
                                  // log('email ${data['useremail']}');
                                  // log('phone ${data['userphone']}');
                                },
                                child: Text("Edit")),
                          )
                        ]),
                      ),
                    );
                  },
                );
              },
            )));
  }
}
