import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/model/uploadcharge.dart';
import 'package:demo_project/utils/string.dart';
import 'package:demo_project/view/Admin/paymentStatusview.dart';
import 'package:demo_project/view/security/add_cab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class rent extends StatefulWidget {
  const rent({super.key});

  @override
  State<rent> createState() => _rentState();
}

class _rentState extends State<rent> {
  final flore = {
    'Floor 1',
    'Floor 2',
    'Floor 3',
    'Floor 4',
  };
  final TextEditingController monthlyrent = TextEditingController();
  final TextEditingController maintaine = TextEditingController();

  final TextEditingController utility = TextEditingController();
  final TextEditingController roomcontrl = TextEditingController();
  final TextEditingController useruid = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final hel = Provider.of<HelperProvider>(context);
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/single flore.jpg',
          fit: BoxFit.cover,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentStatusView(),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            width: 160,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Text(
              'VIEW PAYMENT STATUS',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 250, right: 250),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Upolad Charges",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: useruid,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'userid',
                    // prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'requires';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: monthlyrent,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'monthely Rent',
                    // prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'requires';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: maintaine,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'maintance',
                    // prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'requires';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: utility,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'utility',
                    // prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'requires';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    SizedBox(
                      width: ResHelper.w(context) * .2,
                      child: Consumer<HelperProvider>(
                        builder: (context, helper, child) {
                          return Container(
                            color: Colors.white,
                            child: DropdownButtonFormField(
                              hint: Text('Select flore'),
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              items: flore.map((e) {
                                return DropdownMenuItem(
                                  value: e.toString(),
                                  child: Text(e),
                                );
                              }).toList(),
                              onChanged: (value) {
                                helper.selectedflorebil(value);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: ResHelper.w(context) * .020,
                    ),
                    SizedBox(
                      width: ResHelper.w(context) * 0.2,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: roomcontrl,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: ' ROOM NO:',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'requires';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ResHelper.h(context) * .050,
                ),
                SizedBox(
                    width: 200,
                    child: Consumer<HelperProvider>(
                      builder: (context, helper, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              int mothrent = int.parse(monthlyrent.text);
                              int maitaine = int.parse(maintaine.text);
                              int utilit = int.parse(utility.text);

                              await helper
                                  .uploadBill(
                                UploadCharge(
                                  monthlerent: mothrent,
                                  maintance: maitaine,
                                  utility: utilit,
                                  flore: helper.selectedflore.toString(),
                                  room: roomcontrl.text,
                                ),
                                useruid.text,
                              )
                                  .then((value) {
                                clear();
                                cherryinfo(context, 'add bill succes');
                              });
                              cherrytoast(context, 'add bill succes');
                            }
                            // cherryinfo(context, 'error');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 40, 135, 125),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: Text('Send'),
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      )
    ]));
  }

  clear() {
    useruid.clear();
    monthlyrent.clear();
    maintaine.clear();
    utility.clear();
  }
}
