import 'dart:async';

import 'package:demo_project/collections/controler.dart';
import 'package:demo_project/controller/paymentcontroller.dart';
import 'package:demo_project/view/Admin/home.dart';
import 'package:demo_project/view/Admin/login.dart';
import 'package:demo_project/view/Admin/uploadrent.dart';
import 'package:demo_project/view/Admin/vaccencyupload.dart';
import 'package:demo_project/view/Admin/viewsecurity.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/businesslogic/firebase_options.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/authentication/login.dart';

import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/usertypepage.dart';
import 'package:demo_project/utils/string.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HelperProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Controller(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter ',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:
              //  Uploadvaccency()
              UserType()),
    );
  }
}

class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginPage(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: ResHelper.w(context) * .50,
                      height: ResHelper.h(context) * .10,
                      color: Colors.red,
                      child: Text('User'),
                    ),
                  ),
                  SizedBox(
                    height: ResHelper.h(context) * .10,
                  ),
                  SizedBox(
                    height: ResHelper.h(context) * .10,
                  ),
                  if (kIsWeb)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminLoginPage(),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: ResHelper.w(context) * .50,
                        height: ResHelper.h(context) * .10,
                        color: Colors.red,
                        child: Text('admin'),
                      ),
                    ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
