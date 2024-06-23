import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/model/panicalert.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class alert extends StatefulWidget {
  const alert({super.key});

  @override
  State<alert> createState() => _alertState();
}

class _alertState extends State<alert> {
  final discriptionalert = TextEditingController();
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Emergency Alert")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //width: double.infinity,
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
                  "Emergency:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: discriptionalert,
                  maxLines: 6,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: SizedBox(
                      height: 60,
                      width: 300,
                      child: Consumer<HelperProvider>(
                        builder: (context, helper, child) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.red),
                            onPressed: () {
                              helper
                                  .addPanicAlert(
                                PanicAlert(
                                  description: discriptionalert.text,
                                  uid: auth.currentUser!.uid,
                                ),
                              )
                                  .then((value) {
                                cherrytoast(context, 'Add panic alert succes');
                                claer();
                              });
                            },
                            child: Text(
                              "(( Panic ))",
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        },
                      )),
                )
              ],
            ),
          ),
        ));
  }

  claer() {
    discriptionalert.clear();
  }
}
