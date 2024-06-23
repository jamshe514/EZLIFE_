import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EmercencyContact extends StatelessWidget {
  EmercencyContact({super.key});

  final emercen = {
    'name': 'Police',
  };

  @override
  Widget build(BuildContext context) {
    String _countryCodeController = '+91';

    Future<void> _makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Emergency")),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
      ),
      body: Container(
          width: 800,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ResHelper.w(context) * .120,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text('Police        100'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                _makePhoneCall('100');
                              },
                              child: Icon(Icons.call))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ResHelper.w(context) * .120,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text('Fire       101'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(onPressed: () {}, child: Icon(Icons.call))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ResHelper.w(context) * .120,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text('Ambulance        102'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(onPressed: () {}, child: Icon(Icons.call))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ResHelper.w(context) * .120,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text('Wemen HelpLine       1091'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(onPressed: () {}, child: Icon(Icons.call))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
