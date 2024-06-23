import 'package:demo_project/authentication/login.dart';
import 'package:demo_project/authentication/signuppage.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  //Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/image3.jpg.jpg",
            ),
          )),
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "    Welcome",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                  Text("          Community",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
                  //Icon(
                  // Icons.abc,
                  // size: 130,
                  // ),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/iconhand.png",
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 9, 9, 8),
                                foregroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginPage()));
                            },
                            child: Text('Login'))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 9, 9, 8),
                                foregroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signup()));
                            },
                            child: Text('Sign Up'))),
                  ),
                ]),
          )),
    );
  }
}
