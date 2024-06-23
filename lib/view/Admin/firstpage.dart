import 'package:flutter/material.dart';

class AdminFrontPage extends StatefulWidget {
  const AdminFrontPage({super.key});

  @override
  State<AdminFrontPage> createState() => _AdminFrontPageState();
}

class _AdminFrontPageState extends State<AdminFrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            Image.network(
              "https://images.pexels.com/photos/12810265/pexels-photo-12810265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              scale: 1,
            ),
            // Image.asset("assets/pexels-image-hunter-281453274-13012295.jpg"),
            SizedBox(
              width: 400,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lets\n Start",
                    style: TextStyle(fontSize: 48, fontFamily: 'Cursive'),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 40, 135, 125),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0))),
                          onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginPage()));
                          },
                          child: Text("Login")))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
