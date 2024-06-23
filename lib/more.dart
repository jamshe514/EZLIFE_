import 'package:demo_project/feedback.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/myhomepage.dart';
import 'package:flutter/material.dart';

class more extends StatefulWidget {
  const more({super.key});

  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("More")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: SingleChildScrollView(
          child: Container(
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
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/payment.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 180),
                      child: Text(
                        "Payment",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/booking.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 180),
                      child: Text(
                        "Booking",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/care.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 180),
                      child: Text(
                        "Care",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/activities.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 180),
                      child: Text(
                        "Activites",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/gate.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 180),
                      child: Text(
                        "Buy/Sell",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images (32).jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 180),
                      child: Text(
                        "gateUpdates",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/mainteance.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 180),
                      child: Text(
                        "mainetenance",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => feedback()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/pass.png'),
                            fit: BoxFit.cover),
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 180),
                      child: Text(
                        "Feedback",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
