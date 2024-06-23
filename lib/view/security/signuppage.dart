import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class securityprofile extends StatefulWidget {
  const securityprofile({super.key});

  @override
  State<securityprofile> createState() => _profile_editState();
}

String? url;
File? SelectedImage;

class _profile_editState extends State<securityprofile> {
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

  void _showEditProfileBottomSheet(BuildContext context, String id,
      String username, String useremail, String userphone, String age
      ) {
    final name = TextEditingController();
    final phone = TextEditingController();
    final email = TextEditingController();
    final Age = TextEditingController();

    name.text = username;
    phone.text = userphone;
    email.text = useremail;
    Age.text = age;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Padding(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    TextFormField(
                      controller: email,
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
                    TextFormField(
                      controller: Age,
                      decoration: InputDecoration(
                        labelText: '`Room no',
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
                          // Save changes
                          Navigator.pop(context);
                          log('user id $id');

                          firestore.collection('Register').doc(id).update({
                            'username': name.text,
                            'useremail': email.text,
                            'userphone': phone.text,
                            'room': Age.text,
                          });
                        },
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    String id = auth.currentUser!.uid;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("profile ")),
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
          child: StreamBuilder(
              stream: firestore.collection('Register').doc(id).snapshots(),
              builder: (context, snapshot) {
                DocumentSnapshot data = snapshot.data!;

                String username = data['username'];
                String email = data['email'];
                String phone = data['phone'];
                String age = data['age'];
                String imageurl = data['imageurl'];

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
                                    backgroundImage: NetworkImage(imageurl),
                                  ),
                                ],
                              ),
                              Positioned(
                                  left: w * .60,
                                  top: h * .100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(w * .010)),
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
                                            final currenttime = TimeOfDay.now();
                                            UploadTask uploadTask = FirebaseStorage
                                                .instance
                                                .ref()
                                                .child(
                                                    'shopimage/shop$currenttime')
                                                .putFile(
                                                    SelectedImage!, metadata);
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
                                        icon: Icon(Icons.camera_alt_outlined)),
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
                                Text("${data['username']}")
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
                                Text("${data['phone']}")
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
                                Text("${data['age']}")
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
                                Text("${data['email']}")
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
                              _showEditProfileBottomSheet(context, data.id,
                                  username, email, phone, age);

                              log('user name ${data['username']}');
                              log('email ${data['useremail']}');
                              log('phone ${data['userphone']}');
                              log('age ${data['userage']}');
                            },
                            child: Text("Edit")),
                      )
                    ]),
                  ),
                );
              }),
        ));
  }
}
