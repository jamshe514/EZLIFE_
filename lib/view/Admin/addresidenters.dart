import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/authentication/login.dart';

import 'package:demo_project/model/flore_model.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/view/security/add_cab.dart';
import 'package:demo_project/view/security/home.dart';
import 'package:demo_project/utils/string.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

File? SelectedImage;
bool obsucretext = false;

// void toggle() {
//   setState(() {
//     obsucretext != obsucretext;
//   });
// }

class _signupState extends State<signup> {
  String email = "", password = "";
  String? url;

  String? _validateemail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'please the valid email';
    }
    return null;
  }

  String? _selectedUserType;
  List<String> usertype = ['resident', 'security'];

  final formkey = GlobalKey<FormState>();

  final roomflore = {'Floor 1', 'Floor 2', 'Floor 3', 'Floor 4'};
  @override
  Widget build(BuildContext context) {
    // Future<void> _pickedimagegallery() async {
    //   final pickedimage =
    //       await ImagePicker().pickImage(source: ImageSource.gallery);
    //   if (pickedimage == null) return;
    //   setState(() {
    //     SelectedImage = File(pickedimage.path);
    //   });
    // }

    final provi = Provider.of<HelperProvider>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text("SignUp"),
        //   backgroundColor: Color.fromARGB(44, 24, 255, 216),
        // ),
        body: Container(
            // width: double.infinity,
            // height: 800,
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
                    key: provi.formkey,
                    child: SingleChildScrollView(
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 4, color: Colors.grey),
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
                                        provi.imageAdmin();

                                        // _pickedimagegallery().then((value) async {

                                        // });
                                      },
                                      icon: Icon(Icons.camera_alt_outlined)),
                                ),
                              ),
                            ),
                            DropdownButtonFormField(
                              decoration:
                                  InputDecoration(hintText: "user type"),
                              items: usertype.map((e) {
                                return DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (value) {
                                provi.selectedusertype(value);
                                log(provi.selectedUserType.toString());
                                // setState(() {
                                // _selectedUserType = value.toString();
                                // log(_selectedUserType.toString());
                                // });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: provi.usernamecontroller,
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
                                controller: provi.emailcontroller,
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    alignLabelWithHint: true,
                                    prefixIcon: Icon(Icons.email)),
                                validator: _validateemail),
                            SizedBox(
                              height: 30,
                            ),
                            if (provi.selectedUserType != 'security')
                              Consumer<HelperProvider>(
                                builder: (context, helper, child) {
                                  return DropdownButtonFormField(
                                    hint: Text('select flore'),
                                    items: roomflore.map((e) {
                                      return DropdownMenuItem<String>(
                                        value: e.toString(),
                                        child: Text(e),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      helper.selectflore(value);
                                    },
                                  );
                                },
                              ),
                            if (provi.selectedUserType != 'security')
                              TextFormField(
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: provi.roomno,
                                decoration: InputDecoration(
                                    labelText: "RoomNo",
                                    alignLabelWithHint: true,
                                    prefixIcon:
                                        Icon(Icons.location_city_rounded)),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }

                                  final intValue = int.tryParse(value);
                                  if (intValue == null ||
                                      intValue < 1 ||
                                      intValue > 50) {
                                    return 'room only 50 ';
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
                              controller: provi.phonecontroller,
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
                            Consumer<HelperProvider>(
                              builder: (context, helper, child) {
                                return TextFormField(
                                  obscureText: helper.isobscure,
                                  keyboardType: TextInputType.visiblePassword,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: provi.passwordcontroller,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      labelText: " passsword",
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            helper.togle();
                                          },
                                          icon: Icon(helper.isobscure
                                              ? Icons.visibility_off
                                              : Icons.visibility))),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return " please the  password";
                                    }
                                    return null;
                                  },
                                );
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: provi.conpasswordcontroller,
                              decoration: InputDecoration(
                                labelText: " confirm password",
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return " please the confirm password";
                                }
                                if ((provi.passwordcontroller.text !=
                                    provi.conpasswordcontroller.text)) {
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
                                  child: Consumer<HelperProvider>(
                                    builder: (context, helper, child) {
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                (Color(0xFF27ABC2)),
                                            foregroundColor: (Colors.black)),
                                        onPressed: () async {
                                          if (provi.selectedUserType ==
                                              'security') {
                                            await provi.Registrationsecurity(
                                              context,
                                              provi.emailcontroller.text,
                                              provi.passwordcontroller.text,
                                              provi.usernamecontroller.text,
                                              provi.weburl,
                                              provi.phonecontroller.text,
                                            ).then((value) {
                                              cherrytoast(
                                                  context, 'ADD Succes');
                                            }
                                                //     Navigator.pushAndRemoveUntil(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         securityhome(),
                                                //   ),
                                                //   (route) => false,
                                                // ),
                                                );
                                            log('the secutrity working');
                                          } else {
                                            if (formkey.currentState!
                                                .validate()) {
                                              if (provi.selelctedroom != null &&
                                                  provi.weburl != null &&
                                                  provi.selectedUserType !=
                                                      null) {
                                                helper.checkflore(
                                                  provi.roomno.text,
                                                  context,
                                                  Floremodel(
                                                    floreno: provi.roomno.text,
                                                    Flore: helper.selelctedroom
                                                        .toString(),
                                                  ),
                                                );
                                              } else {
                                                cherryinfo(
                                                    context, 'fill the form');
                                                log('plesae select flore');
                                              }
                                              log('the resident');
                                            }
                                          }
                                        },
                                        child: Text("sumbit"),
                                      );
                                    },
                                  )),
                            ),
                            SizedBox(),
                            // TextButton(
                            //     onPressed: () {
                            //       log('image upload ==========================${provi.weburl.toString()}=====================================================================');
                            //     },
                            //     child: Text('chekc'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
