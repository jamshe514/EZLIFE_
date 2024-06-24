import 'package:demo_project/Emergency.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/model/panicalert.dart';
import 'package:demo_project/view/security/bookingdetails.dart';
import 'package:demo_project/view/security/notificationsecurity.dart';
import 'package:demo_project/view/security/panicalert.dart';
import 'package:demo_project/view/security/roomvacency.dart';
import 'package:demo_project/view/users/activites.dart';
import 'package:demo_project/authentication/login.dart';
import 'package:demo_project/collections/controler.dart';
import 'package:demo_project/view/security/add_cab.dart';
import 'package:demo_project/view/security/add_delivery.dart';
import 'package:demo_project/view/security/add_guest.dart';
import 'package:demo_project/view/security/contacts.dart';
import 'package:demo_project/view/security/emercency_contacr.dart';
import 'package:demo_project/view/security/history_gatepass.dart';
import 'package:demo_project/view/security/mainntaine.dart';
import 'package:demo_project/view/security/moreadd.dart';
import 'package:demo_project/view/security/security_contacts.dart';
import 'package:demo_project/view/security/view_visiters.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class securityhome extends StatefulWidget {
  securityhome({super.key});

  @override
  State<securityhome> createState() => _securitysignupState();
}

class _securitysignupState extends State<securityhome> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<HelperProvider>(context);
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(auth.currentUser!.email.toString()),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationSecurity(),
                    ));
              },
              icon: Icon(Icons.notifications)),
          SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                _scafoldKey.currentState?.openEndDrawer();
              },
              icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          color: Color.fromRGBO(165, 215, 232, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 231, 234, 236)),
                  child: FutureBuilder(
                    future: helper.getsecuritydata(auth.currentUser!.uid),
                    builder: (context, snapshot) {
                      final data = helper.securitymodel;
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(data!.securityprofile))),
                      );
                    },
                  )),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("About"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("Room Vaccanies"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RoomvacencySecurity()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications_active_outlined),
                title: Text("Panic Alert"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PanicAlertHome()));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.notifications_active_outlined),
              //   title: Text("Booking Details"),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => BokkingDetails(),
              //         ));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () {
                  Controller().logout().then((value) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => loginPage()),
                      (route) => false,
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => visitors_view()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text(
                          "View Visitores",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Securitycontacts()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text(
                          "Other security Contacts",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text(
                          "Residents Contacts",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmercencyContact()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text(
                          "Emergency Conatacts",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VisiterHistory()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text(
                          "History gate pass",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Maintaine(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Text(
                          "view Mainteance",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => add_guest(),
                                ));
                          },
                          icon: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                        Text("Add Visitores")
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
