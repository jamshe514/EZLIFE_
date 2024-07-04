import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/forgetpassword.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/authentication/signuppage.dart';
import 'package:demo_project/view/security/home.dart';
import 'package:demo_project/usertypepage.dart';
import 'package:demo_project/utils/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class loginPage extends StatefulWidget {
  loginPage({super.key});

  @override
  State<loginPage> createState() => _login();
}

bool isloading = false;

class _login extends State<loginPage> {
  final _formkey = GlobalKey<FormState>();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final db = FirebaseFirestore.instance;
  List<String> usertype = ['resident', 'security'];

  @override
  Widget build(BuildContext context) {
    String email = "", password = "";
    userSignup() async {
      try {
        setState(() {
          isloading = true;
        });

        // Attempt to sign in with email and password
        UserCredential credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (credential.user != null) {
          String idm = credential.user!.uid;

          print('itha iddddd   $idm=================================');

          final usertypecheck = await db.collection('Register').doc(idm).get();

          if (usertypecheck.exists) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => bottomnavipage(
                        indexnum: 0,
                      )),
              (route) => false,
            );
          } else {
            final securitycheck =
                await db.collection('Security').doc(idm).get();

            if (securitycheck.exists) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => securityhome()),
              );
            }
          }

          // if (usertypecheck.exists) {
          //   if (usertype = usertypecheck['usertype']) {
          //     if (usertype == 'resident') {
          //       Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => bottomnavipage(
          //                   indexnum: 0,
          //                 )),
          //       );
          //     }
          //   } else {
          //     final securitycheck =
          //         await db.collection('Security').doc(idm).get();

          //     if (securitycheck.exists) {
          //       Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(builder: (context) => securityhome()),
          //       );
          //     }
          //   }
          // }
        }

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Success"),
          ),
        );

        // Reset the loading state
        setState(() {
          isloading = false;
        });
      } on FirebaseAuthException catch (e) {
        //   // Handle FirebaseAuth exceptions
        setState(() {
          isloading = false;
        });

        // Show a generic error message

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid email or password."),
          ),
        );
      } catch (e) {
        // Handle generic exceptions
        setState(() {
          isloading = false;
        });
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 800,
          //  padding: EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Form(
            key: _formkey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 200, top: 100),
                  child: Text("Login in ",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.acme(fontSize: 30)
                      //  TextStyle(
                      //   fontWeight: FontWeight.w900,
                      //   fontSize: 30,
                      //   fontStyle: FontStyle.italic,
                      // ),
                      // textAlign: TextAlign.right,
                      ),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Email",
                    hintText: " email",
                    fillColor: const Color(0xFFF3EEEE),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " please the Email";
                    }
                    RegExp emailregep = RegExp("");
                    if (!emailregep.hasMatch(value)) {
                      return 'please enter the valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<HelperProvider>(
                  builder: (context, helper, child) {
                    return TextFormField(
                      obscureText: helper.isobscure,
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "password",
                          hintText: " password",
                          fillColor: const Color(0xFFF3EEEE),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
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
                const SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                      child: const Text(
                        "Forgetpassword?",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: isloading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(12, 184, 193, 1)),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                email = usernamecontroller.text;
                                password = passwordcontroller.text;
                                //Navigator.push(
                                // context,
                                //MaterialPageRoute(
                                //  builder: (context) =>
                                //      bottomnavipage(indexnum: 0)));
                              });
                              await userSignup();
                            }
                            //Navigator.push(context,
                            //  MaterialPageRoute(builder: (context) => home_user()));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 25),
                  child: Row(
                    children: [
                      const Text(
                        "Need account?   Go to Your Near Apartment ",
                        style: TextStyle(color: Colors.black),
                      ),
                      // TextButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => signup()));
                      //     },
                      //     child: const Text(
                      //       "SignUp",
                      //       style: TextStyle(
                      //           color: Color.fromRGBO(32, 57, 199, 1),
                      //           decoration: TextDecoration.underline,
                      //           decorationColor:
                      //               Color.fromRGBO(32, 57, 199, 1)),
                      //     ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 40,
                        endIndent: 10,
                        color: Colors.black,
                        thickness: 1,
                        height: 3,
                      ),
                    ),
                    Text("OR"),
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 40,
                        color: Colors.black,
                        thickness: 1,
                        height: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/Gmail-logo.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Image.asset(
                        "assets/twittwelogo.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Image.asset(
                        "assets/facebooklogo.png",
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
