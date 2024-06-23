import 'dart:developer';
import 'dart:io';

import 'package:demo_project/buy_sell.dart';
import 'package:demo_project/model/productbuysell.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class selladd extends StatefulWidget {
  const selladd({super.key});

  @override
  State<selladd> createState() => _maintenanceState();
}

class _maintenanceState extends State<selladd> {
  final prdoname = TextEditingController();
  final prdctdiscription = TextEditingController();
  final price = TextEditingController();

  String? url;
  @override
  Widget build(BuildContext context) {
    File? fileimage;
    ImagePicker imagePicker = ImagePicker();

    opegallery() async {
      await imagePicker.pickImage(source: ImageSource.gallery).then((xfile) {
        fileimage = File(xfile!.path);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Buy/Sell")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 900,
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
                TextField(
                  controller: prdoname,
                  decoration: InputDecoration(
                    filled: true,
                    // labelText: "Name",
                    hintText: " Product Name",
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
                  child: TextField(
                    controller: prdctdiscription,
                    maxLines: 6,
                    decoration: InputDecoration(
                      filled: true,
                      // labelText: "Name",
                      hintText: " Product Description ",
                      // prefixIcon: Icon(Icons.person),
                      fillColor: Color(0xFFF3EEEE),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    final time = TimeOfDay.now();
                    await opegallery().then((value) async {
                      SettableMetadata metadata =
                          SettableMetadata(contentType: 'image/jpeg');
                      UploadTask uploadTask = FirebaseStorage.instance
                          .ref()
                          .child('productimage/$time')
                          .putFile(fileimage!, metadata);
                      TaskSnapshot snapshot = await uploadTask;
                      await snapshot.ref.getDownloadURL().then((value) {
                        url = value;
                      });

                      // log('${url.toString()}=====================');
                    });
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Row(
                        children: [
                          Text("Attach a picture"),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(Icons.camera_alt)
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    width: 320,
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                TextField(
                  controller: price,
                  decoration: InputDecoration(
                    filled: true,
                    // labelText: "Name",
                    hintText: " Price",
                    // prefixIcon: Icon(Icons.person),
                    fillColor: Color(0xFFF3EEEE),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: 100,
                    height: 40,
                    child: Consumer<HelperProvider>(
                      builder: (context, helper, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 12, 184, 193)),
                          onPressed: () async {
                            if (url != null)
                              await helper
                                  .addProduct(
                                ProductBuysell(
                                  productname: prdoname.text,
                                  ProductDiscription: prdctdiscription.text,
                                  Productimage: url.toString(),
                                  ProdcutPeice: price.text,
                                  uid: auth.currentUser!.uid,
                                ),
                              )
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => buy_sell(),
                                    ));
                                cherrytoast(context, 'Add product');
                              });

                            log('sdiddbisdbsjd thisi');
                          },
                          child: Text(
                            "Ok",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    )),
                //fileimage == null ? Text("loading") : Image.file(fileimage!)
              ],
            ),
          ),
        ));
  }

  File? fileimage;
  ImagePicker imagePicker = ImagePicker();

  opegallery() async {
    await imagePicker.pickImage(source: ImageSource.gallery).then((xfile) {
      fileimage = File(xfile!.path);
    });
  }
}
