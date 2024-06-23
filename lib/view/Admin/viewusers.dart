import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/model/usermodel.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AdminViewUsers extends StatefulWidget {
  const AdminViewUsers({super.key});

  @override
  State<AdminViewUsers> createState() => _AdminViewUsersState();
}

class _AdminViewUsersState extends State<AdminViewUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/bg.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Column(children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'About Us',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(child: Consumer<HelperProvider>(
          builder: (context, helper, child) {
            // final count = helper.getusercout;
            return StreamBuilder<QuerySnapshot>(
              stream: helper.getuser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                List<Usermodel> list = [];
                list = snapshot.data!.docs
                    .map((e) =>
                        Usermodel.fromjsone(e.data() as Map<String, dynamic>))
                    .toList();

                if (snapshot.hasData) {
                  return list.isEmpty
                      ? Center(
                          child: Text('nouser'),
                        )
                      : ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                width: double.infinity,
                                // height: 100,
                                child: Row(
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: Border.all(),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                list[index].userprofileimg,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 17.0, left: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                              'NAME : ${list[index].username}'),
                                          Text(
                                              'PHONENUMBER:${list[index].phonenumber}'),
                                          Text(
                                              'ROOM NO : ${list[index].rooomnumber}'),
                                          Text(
                                              'FLORE NO : ${list[index].florenumber}'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 190),
                                      child: SizedBox(
                                        width: 120,
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 217, 32, 32),
                                                foregroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero)),
                                            onPressed: () {
                                              helper.removedoc(
                                                  list[index].id, context);
                                            },
                                            child: Text("Remove")),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                }
                return Container();
              },
            );
          },
        )),
      ])
    ]));
  }
}
