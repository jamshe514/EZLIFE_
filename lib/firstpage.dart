import 'package:flutter/material.dart';

class Firstapp extends StatefulWidget {
  Firstapp({super.key});

  @override
  State<Firstapp> createState() => _FirstState();
}

class _FirstState extends State<Firstapp> {
  int _selectindex = 0;
  bool isButtonEnabled = true;
  void _onItemTapped(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.add_sharp,
            color: Colors.green,
            size: 33,
          ),
          backgroundColor: Colors.cyan,
          toolbarHeight: 100,
          bottom: AppBar(
            backgroundColor: Colors.black,
          ),
          title: Text("window"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.airplanemode_active_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.macro_off_outlined),
            )
          ],
        ),

        body:
        Image.asset(
          "assets/image.jpg",
          width: double.infinity,
          
          
        ),
      
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit_outlined), label: "search")
          ],
          currentIndex: _selectindex,
          onTap: _onItemTapped,
        ));
  }
}
