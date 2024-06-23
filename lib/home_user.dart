import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/socialnetwork.dart';
import 'package:demo_project/view/security/emercency_contacr.dart';
import 'package:demo_project/view/users/activites.dart';
import 'package:demo_project/view/users/booking.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/buy_sell.dart';
import 'package:demo_project/view/users/carebooking.dart';
import 'package:demo_project/gatevisiters.dart';
import 'package:demo_project/authentication/login.dart';
import 'package:demo_project/maintenance.dart';
import 'package:demo_project/model/communitypost_model.dart';
import 'package:demo_project/more.dart';
import 'package:demo_project/payment_1.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/roomvacency.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_user extends StatefulWidget {
  const home_user({super.key});

  @override
  State<home_user> createState() => _home_userState();
}

class _home_userState extends State<home_user> {
  late List<bool> isFollowingList;
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _firebase = FirebaseAuth.instance.currentUser!.uid;

  final auth = FirebaseAuth.instance;

  void _selectRandomIndex() {
    final Random random = Random();
    setState(() {
      _selectedIndex = random.nextInt(4);
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure logout'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                try {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginPage(),
                      ),
                      (route) => false,
                    );
                  });
                } catch (e) {
                  print('logout succes $e');
                }
              },
            ),
            TextButton(
              child: const Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hel = Provider.of<HelperProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
        title: Text("Hellow ${auth.currentUser!.email}"),

        //   actions: [
        //     IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     GestureDetector(
        //         onTap: () async {
        //           try {
        //             await FirebaseAuth.instance.signOut().then((value) {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => loginPage(),
        //                   ));
        //               SnackBar(
        //                 content: Text("logout succes"),
        //               );
        //             });
        //           } on FirebaseException catch (e) {
        //             print(
        //                 '----------------------------error logout$e-------------------------------');
        //           }
        //         },
        //         child: Icon(Icons.logout))
        //   ],
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Consumer<HelperProvider>(
              builder: (context, helper, child) {
                return FutureBuilder(
                  future: helper.fetchuserdata(auth.currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final data = helper.usermodel;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(helper.usermodel!.userprofileimg),
                        ),
                      ),
                    );
                  },
                );
              },
            )),
            ListTile(
              leading: Icon(Icons.emergency),
              title: Text('Emergency Contects'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmercencyContact()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Room vacanices'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Roomvacency()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('About'),
              onTap: () {
                print(
                    '=======================${auth.currentUser!.uid} ${hel.usermodel!.userprofileimg} =====================================');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                _showMyDialog();
              },
            ),
          ],
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
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 40,
                    //   width: 350,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //         hintText: "search",
                    //         prefixIcon: Icon(Icons.search),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20),
                    //         )),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(right: 210, top: 10),
                      child: Text(
                        "Our Facilities",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => payment_first()));
                              },
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/payment.jpg"),
                                radius: 30,
                              ),
                            ),
                            Text("Payment")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => visitors()));
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/gast.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Gate Updates")
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => booking()));
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/booking.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Booking")
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => bookingpagecare()));
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/care.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Care")
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Activityadd()));
                              },
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/activities.jpg"),
                                radius: 30,
                              ),
                            ),
                            Text("Acitivites")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => maintenance()));
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/gate.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Maintenance")
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => buy_sell()));
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/booking.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text("Buy/Sell")
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => more()));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images (20).jpeg"),
                              radius: 36,
                            ),
                          ),
                          Text("More")
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<HelperProvider>(
                      builder: (context, helper, child) {
                        return StreamBuilder<QuerySnapshot>(
                          stream: helper.allpost(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return Center(child: Text("No posts available"));
                            }
                            List<CommunityModel> list = [];
                            list = snapshot.data!.docs.map((e) {
                              return CommunityModel.fromjasone(
                                e.data() as Map<String, dynamic>,
                              );
                            }).toList();

                            List<CommunityModel> lastlist = [];

                            if (list.isNotEmpty) {
                              lastlist.add(list.last);
                            }

                            final lastDoc = snapshot.data!.docs.first;
                            final CommunityModel lastPost =
                                CommunityModel.fromjasone(
                                    lastDoc.data() as Map<String, dynamic>);

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Container(
                                  // height: 350,
                                  width: double.infinity,
                                  color: Color.fromARGB(255, 248, 246, 246),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("community Buzz"),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 160.0),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SocialNetwork()));
                                                },
                                                child: Text("View All")),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 350,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    lastPost.postimage),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Column(
                                            children: [
                                              Text(
                                                lastPost.postDiscription,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                lastPost.postDiscription,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
