// import 'package:demo_project/newpassword.dart';
// import 'package:demo_project/verification.dart';
// import 'package:flutter/material.dart';

// class forget extends StatefulWidget {
//   const forget({super.key});

//   @override
//   State<forget> createState() => _forgetState();
// }

// class _forgetState extends State<forget> {
//   final _formkey = GlobalKey<FormState>();
//   var emailcontroller = TextEditingController();
//   @override
//   String? _validateemail(value) {
//     if (value!.isEmpty) {
//       return 'please enter an email';
//     }
//     RegExp emailRegExp = RegExp(
//         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     if (!emailRegExp.hasMatch(value)) {
//       return 'please the valid email';
//     }
//     return null;
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Container(
//           width: double.infinity,
//           height: 800,
//           padding: EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/bg.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Padding(
//               padding: const EdgeInsets.only(top: 40),
//               child: Form(
//                 key: _formkey,
//                 child: Column(children: [
//                   Text(
//                     "Reset Password",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Image.asset("assets/pass.png"),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 80),
//                     child: TextFormField(
//                       controller: emailcontroller,
//                       validator: _validateemail,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         filled: true,
//                         labelText: "email",
//                         // hintText: " email",
//                         prefixIcon: Icon(Icons.email_sharp),
//                         fillColor: Color(0xFFF3EEEE),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(0)),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 80),
//                     child: SizedBox(
//                       width: 100,
//                       height: 40,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Color.fromARGB(255, 12, 184, 193)),
//                         onPressed: () {
//                           if (_formkey.currentState!.validate()) {
//                             setState(() {
//                               emailcontroller =
//                                   emailcontroller.text as TextEditingController;
//                             });
//                           }
//                         },
//                         child: Text(
//                           "SENDS",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ]),
//               ))),
//     ));
//   }
// }

import 'package:demo_project/authentication/login.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  String email = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" RestPassword")),
        backgroundColor: Color.fromRGBO(158, 203, 212, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => loginPage()));
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      backgroundColor:
          Colors.transparent, // Set Scaffold background to transparent
      body: Container(
        height: 800,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Enter your email address to reset your password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      const Text(
                        'Your forgot password  enter and continue ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 19, 19, 164),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "email",
                            prefixIcon: Icon(Icons.email),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter email";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.08,
                      ),
                      SizedBox(
                          width: constraints.maxWidth * 0.4,
                          child: Consumer<HelperProvider>(
                            builder: (context, helper, child) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromRGBO(12, 184, 193, 1))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                    });
                                    helper.getRegister(email, context);
                                  }
                                },
                                child: Text('send'),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
