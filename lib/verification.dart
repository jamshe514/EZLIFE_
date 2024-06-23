import 'package:demo_project/newpassword.dart';
import 'package:demo_project/successfully.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class veriflyPage extends StatefulWidget {
  const veriflyPage({super.key});

  @override
  State<veriflyPage> createState() => _veriflyState();
}

class _veriflyState extends State<veriflyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          width: double.infinity,
          height: 800,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(children: [
              Text(
                "Verification",
                style: TextStyle(fontSize: 32),
              ),
              Image.asset("assets/pass.png"),
              Text(
                "Enter the Verification Code:",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        )),
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        )),
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        )),
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      "if did not receive code",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.indigo),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 12, 184, 193)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Newpass()));
                  },
                  child: Text(
                    "Verifly",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ]),
          )),
    ));
  }
}
