import 'dart:developer';

import 'package:demo_project/utils/string.dart';
import 'package:demo_project/view/Admin/complaintns.dart';
import 'package:demo_project/view/Admin/uploadrent.dart';
import 'package:demo_project/view/Admin/vaccencyupload.dart';
import 'package:demo_project/view/Admin/viewsecurity.dart';
import 'package:demo_project/view/Admin/viewusers.dart';

import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
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
                          onPressed: () async {
                            try {
                              auth.signOut();
                            } catch (e) {
                              log(' $e error');
                            }
                          },
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
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      color: Colors.transparent,
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.arrow_forward_ios_outlined),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminViewUsers()));
                                    },
                                    child: const Text(
                                      "View Users",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.arrow_forward_ios_rounded),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminViewSecurity()));
                                      },
                                      child: const Text(
                                        "View Securities",
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.arrow_forward_ios_rounded),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FeedbackViewAdmin()));
                                      },
                                      child: const Text(
                                        "View Complaints",
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.arrow_forward_ios_rounded),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Uploadvaccency()));
                                      },
                                      child: const Text(
                                        "Upload Vacancy",
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.arrow_forward_ios_rounded),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => rent()));
                                      },
                                      child: const Text(
                                        "Upload Rent",
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    // Main content area (empty for now)
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
