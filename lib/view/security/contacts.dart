import 'package:demo_project/model/usermodel.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<HelperProvider>(context);

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
      Provider.of<HelperProvider>(context, listen: false).getAllResidents();
    }

    final searchresident = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Residents Contacts")),
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
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  hintText: 'Search Residers Phone Number',
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  helper.getAllResidents();
                },
                onChanged: (value) {
                  helper.residentsSearch(value);
                },
              ),
              Expanded(child: Consumer<HelperProvider>(
                builder: (context, helper, child) {
                  return StreamBuilder(
                    stream: helper.getuser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      List<Usermodel> list = [];

                      list = snapshot.data!.docs.map((e) {
                        return Usermodel.fromjsone(
                            e.data() as Map<String, dynamic>);
                      }).toList();

                      final searchresult = helper.searchAllResident.isEmpty
                          ? list
                          : helper.searchAllResident;

                      return list.isEmpty
                          ? Center(
                              child: Text('NO RESIDENT'),
                            )
                          : ListView.builder(
                              itemCount: searchresult.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Card(
                                    child: Container(
                                      width: double.infinity,
                                      // height: 100,s
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(list[
                                                              index]
                                                          .userprofileimg))),
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
                                                    'NAME :${searchresult[index].username}'),
                                                Text(
                                                    'PHONE :${searchresult[index].phonenumber}'),
                                                Text(
                                                    'ROOM no :${searchresult[index].rooomnumber}'),
                                                Text(
                                                    'Floreno: ${searchresult[index].florenumber}'),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 50),
                                            child: GestureDetector(
                                              onTap: () {
                                                _makePhoneCall(
                                                    list[index].phonenumber);
                                              },
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.green,
                                                child: Icon(Icons.phone),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
