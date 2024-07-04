import 'dart:developer';

import 'package:demo_project/model/securitymodel.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Securitycontacts extends StatefulWidget {
  const Securitycontacts({super.key});

  @override
  State<Securitycontacts> createState() => _ContactPageState();
}

class _ContactPageState extends State<Securitycontacts> {
  String _countryCodeController = '+91';

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<HelperProvider>(context, listen: false).getsecurityontap();
  }

  final searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HelperProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Security Contacts")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
                child: Column(children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Security name",
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchcontroller.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (value) {
                      controller.searchsecurity(value);
                    },
                    onTap: () async {
                      controller.getsecurityontap();
                    },
                  ),
                  Expanded(child: Consumer<HelperProvider>(
                    builder: (context, helper, child) {
                      return StreamBuilder(
                        stream: helper.getSecurities(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List<Securitymodel> list = [];

                          list = snapshot.data!.docs.map((e) {
                            return Securitymodel.fromjsone(
                                e.data() as Map<String, dynamic>);
                          }).toList();

                          final searchlist = controller.searchdata.isEmpty
                              ? controller.allsecurity
                              : controller.searchdata;
                          return controller.allsecurity.isEmpty
                              ? Center(
                                  child: Text('no data'),
                                )
                              : ListView.builder(
                                  itemCount: searchlist.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Card(
                                        child: Container(
                                          width: double.infinity,
                                          height: 100,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        searchlist[index]
                                                            .securityprofile,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 17.0, left: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Email:${searchlist[index].securityEmail}',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                    Text(
                                                        'NO:${searchlist[index].securityphonenumber}'),
                                                    Text(
                                                        'NAME:${searchlist[index].securityName}'),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 30,
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _makePhoneCall(list[index]
                                                        .securityphonenumber);
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Colors.green,
                                                    child: Icon(Icons.phone),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                        },
                      );
                    },
                  )),
                ]))));
  }
}
