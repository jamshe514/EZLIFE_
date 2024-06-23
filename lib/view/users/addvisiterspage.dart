import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class addvisitors extends StatefulWidget {
  const addvisitors({super.key});

  @override
  State<addvisitors> createState() => _addvisitorsState();
}

class _addvisitorsState extends State<addvisitors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Gate Updates")),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            height: 900,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Name",
                          // hintText: " Name",
                          prefixIcon: Icon(Icons.person),
                          fillColor: Color(0xFFF3EEEE),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Phone No",
                          //  hintText: " Name",
                          prefixIcon: Icon(Icons.phone),
                          fillColor: Color(0xFFF3EEEE),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: " Vehicle No",
                          //  hintText: " Name",
                          prefixIcon: Icon(Icons.bike_scooter),
                          fillColor: Color(0xFFF3EEEE),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: " Number of Pepople",
                          //  hintText: " Name",
                          prefixIcon: Icon(Icons.person),
                          // suffixIcon: Icon(Icons.person),
                          fillColor: Color(0xFFF3EEEE),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: " time",
                          //  hintText: " Name",
                          prefixIcon: Icon(Icons.timer),
                          // suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          fillColor: Color(0xFFF3EEEE),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 45,
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (Color(0xFF27ABC2)),
                            foregroundColor: (Colors.black)),
                        onPressed: () {},
                        child: Text("Add"),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
