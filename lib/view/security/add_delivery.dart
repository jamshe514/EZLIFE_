import 'package:demo_project/view/security/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class adddevivery extends StatefulWidget {
  const adddevivery({super.key});

  @override
  State<adddevivery> createState() => _add_cabState();
}

final _formkey = GlobalKey<FormState>();
final usernamecontroller = TextEditingController();
final roomcontroller = TextEditingController();
final phonecontroller = TextEditingController();
final companycontroller = TextEditingController();
final vehiclenocontroller = TextEditingController();

class _add_cabState extends State<adddevivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(" Add Cab")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
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
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                    ),
                    TextFormField(
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
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
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
                      controller: companycontroller,
                      decoration: InputDecoration(
                        labelText: "company From",
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.place),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please the  company name";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: vehiclenocontroller,
                      decoration: InputDecoration(
                        labelText: "Vehicle No",
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.pedal_bike_outlined),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please the  vehicle no";
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
                            if (_formkey.currentState!.validate()) ;
                          },
                          child: Text("Send"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
