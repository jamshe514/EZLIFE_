import 'dart:developer';

import 'package:demo_project/helpers.dart';
import 'package:demo_project/model/guestmodel.dart';
import 'package:demo_project/controller/helperprovider.dart';

import 'package:demo_project/utils/string.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class add_guest extends StatefulWidget {
  const add_guest({super.key});

  @override
  State<add_guest> createState() => _add_cabState();
}

final _formkey = GlobalKey<FormState>();
final usernamecontroller = TextEditingController();
final roomcontroller = TextEditingController();
final phonecontroller = TextEditingController();
final noofpecontroller = TextEditingController();
final vehiclenocontroller = TextEditingController();
String? producturl;

class _add_cabState extends State<add_guest> {
  @override
  Widget build(BuildContext context) {
    final wdith = MediaQuery.of(context).size.width;
    final hright = MediaQuery.of(context).size.height;

    final flore = {
      'Floor 1',
      'Floor 2',
      'Floor 3',
      'Floor 4',
    };

    final hel = Provider.of<HelperProvider>(context);

    final type = {
      'Delivery',
      'Gust',
      'Maintance',
      'others',
    };
    final String pattern = r'^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{3}$';

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(" Add Guest")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            // height: 950,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      child: Stack(
                        children: [
                          Container(
                            width: ResHelper.w(context) * .20,
                            height: ResHelper.h(context) * .20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(),
                              // image: DecorationImage(image: FileImage(_imageFile ))
                            ),
                          ),
                          Positioned(
                            top: ResHelper.w(context) * .220,
                            left: ResHelper.w(context) * .090,
                            child: IconButton(
                              onPressed: () async {
                                await hel.pickedimagegallery();

                                // await _pickImage(ImageSource.gallery)
                                //     .then((value) async {
                                //   SettableMetadata metadata = SettableMetadata(
                                //       contentType: 'image/jpeg');
                                //   final currenttime = TimeOfDay.now();
                                //   UploadTask uploadTask = FirebaseStorage
                                //       .instance
                                //       .ref()
                                //       .child('geustimage/$currenttime')
                                //       .putFile(_imageFile!, metadata);
                                //   TaskSnapshot snapshot = await uploadTask;
                                //   await snapshot.ref
                                //       .getDownloadURL()
                                //       .then((value) {
                                //     setState(() {
                                //       producturl = value;
                                //     });
                                //   });
                                // });
                                // Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                size: ResHelper.w(context) * .10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                          labelText: "Name",
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.person_rounded)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please the  name";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      controller: phonecontroller,
                      decoration: InputDecoration(
                        labelText: "Phone No",
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please the  phone";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: roomcontroller,
                      decoration: InputDecoration(
                        labelText: "room no",
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.location_city),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        final intValue = int.tryParse(value);
                        if (intValue == null || intValue < 1 || intValue > 50) {
                          return 'room only 50 ';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: ResHelper.h(context) * .020,
                    ),
                    DropdownButtonFormField(
                      hint: Text('Select flore'),
                      items: flore.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e.toString(),
                        );
                      }).toList(),
                      onChanged: (value) {
                        hel.selectfloresec(value);
                      },
                    ),
                    SizedBox(
                      height: ResHelper.h(context) * .030,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: noofpecontroller,
                      decoration: InputDecoration(
                        labelText: "no:of pepopels",
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.pedal_bike_outlined),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please the  no:of pepoples";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: vehiclenocontroller,
                      decoration: InputDecoration(
                        labelText: "Vehicle No",
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.pedal_bike_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number plate';
                        }
                        if (!RegExp(pattern).hasMatch(value)) {
                          return 'Invalid number plate format ex(KL00AA0000)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: ResHelper.h(context) * .030,
                    ),
                    SizedBox(
                      width: ResHelper.w(context) * .7,
                      child: Consumer<HelperProvider>(
                        builder: (context, helper, child) {
                          return DropdownButtonFormField(
                            hint: Text('SELECT TYPE'),
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            items: type.map((e) {
                              return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              helper.seelctedtypet(value);
                            },
                          );
                        },
                      ),
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
                                    backgroundColor: (Color(0xFF27ABC2)),
                                    foregroundColor: (Colors.black)),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    if (hel.url != null) {
                                      hel
                                          .checkuserexist(
                                              helper.selecteedfloresec,
                                              roomcontroller.text,
                                              GuestModel(
                                                guestname:
                                                    usernamecontroller.text,
                                                phonenumber:
                                                    phonecontroller.text,
                                                roomnumber: roomcontroller.text,
                                                nofpeople:
                                                    noofpecontroller.text,
                                                vehiclenumber:
                                                    vehiclenocontroller.text,
                                                image: hel.url.toString(),
                                                status: 'Pending',
                                                florenumber: hel
                                                    .selecteedfloresec
                                                    .toString(),
                                                typeguest:
                                                    hel.seelctedtype.toString(),
                                                date: date,
                                              ),
                                              context)
                                          .then((value) => clearcontrool());
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text('Please wait')));
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('succes')));
                                  }
                                },
                                child: Text("Send"),
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  clearcontrool() {
    usernamecontroller.clear();
    phonecontroller.clear();
    roomcontroller.clear();
    noofpecontroller.clear();
    vehiclenocontroller.clear();
  }
}





// helper
//                                           .addGuest(
//                                         GuestModel(
//                                           guestname: usernamecontroller.text,
//                                           phonenumber: phonecontroller.text,
//                                           roomnumber: roomcontroller.text,
//                                           nofpeople: noofpecontroller.text,
//                                           vehiclenumber:
//                                               vehiclenocontroller.text,
//                                           image: hel.url.toString(),
//                                           status: 'Pending',
//                                           florenumber:
//                                               hel.selecteedfloresec.toString(),
//                                           typeguest:
//                                               hel.seelctedtype.toString(),
//                                           date: date,
//                                         ),
//                                       )
//                                           .then((value) {
//                                         cherrytoast(
//                                             context, 'Add guest succes');
//                                         clearcontrool();
//                                       });