import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/view/security/home.dart';
import 'package:demo_project/securitysignup.dart';
import 'package:demo_project/usertypepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

const adminuid = 'ZKZ0qy2G44T3afEl9gv6hGRmCbh2';

void checktype(String usertype, BuildContext context) {
  switch (usertype) {
    case 'resident':
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => bottomnavipage(
                  indexnum: 0,
                )),
      );
    case 'security':
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => securityhome()),
      );
  }
}

cherrytoast(BuildContext context, msg) {
  CherryToast.success(title: Text(msg, style: TextStyle(color: Colors.black)))
      .show(context);
}

cherryinfo(BuildContext context, msg) {
  CherryToast.info(
    title: Text(msg, style: TextStyle(color: Colors.black)),
    actionHandler: () {
      print("Action button pressed");
    },
  ).show(context);
}

class ResHelper {
  static w(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static h(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

String time = DateFormat('h:mm a').format(DateTime.now());
// String date = DateFormat("dd/M/yyyy").format(DateTime.now());
String date = DateFormat("dd/MM/yyyy").format(DateTime.now());
