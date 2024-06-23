import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class security extends StatefulWidget {
  const security({super.key});

  @override
  State<security> createState() => _securityState();
}

class _securityState extends State<security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
            ),
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
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
                child: TextField(
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
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: " Age",
                    //  hintText: " Name",
                    prefixIcon: Icon(Icons.person_outlined),
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
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: " Password",
                    //  hintText: " Name",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: " Conform password",
                    //  hintText: " Name",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                  child: Text("sumbit"),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
