import 'package:demo_project/controller/helperprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final admemail = TextEditingController();
  final admpassword = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fronview apart.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: Text(
                        'Login In',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 500,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: admemail,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Consumer<HelperProvider>(
                      builder: (context, helper, child) {
                        return SizedBox(
                          width: 500,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: admpassword,
                            obscureText: helper.isobscure,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: IconButton(
                                    onPressed: () {
                                      helper.togle();
                                    },
                                    icon: Icon(helper.isobscure
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required password';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: 200,
                        child: Consumer<HelperProvider>(
                          builder: (context, instance, child) {
                            return ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  instance.Adminloggin(
                                      admemail.text, admpassword.text, context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 40, 135, 125),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                              ),
                              child: Text('Login'),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
