import 'package:demo_project/Emergency.dart';
import 'package:demo_project/view/users/activites.dart';
import 'package:demo_project/discover.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/authentication/signuppage.dart';
import 'package:demo_project/profile_edit.dart';
import 'package:demo_project/socialnetwork.dart';
import 'package:flutter/material.dart';

class bottomnavipage extends StatefulWidget {
  int indexnum = 0;

  bottomnavipage({super.key, required this.indexnum});

  @override
  State<bottomnavipage> createState() => _bottomnavipageState();
}

class _bottomnavipageState extends State<bottomnavipage> {
  final _pages = [
    const home_user(),
    const profile_edit(),
    const SocialNetwork(),
    const discover(),
    const alert(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[widget.indexnum],
      bottomNavigationBar: myNav(
        index: widget.indexnum,
        onTap: (index) {
          setState(() {
            widget.indexnum = index;
          });
        },
      ),
    );
  }
}

Widget myNav({
  int? index,
  void Function(int)? onTap,
  selectedcolor,
}) {
  return BottomNavigationBar(
    showUnselectedLabels: true,
    currentIndex: index!,
    selectedItemColor: Colors.black,
    unselectedItemColor: Color.fromARGB(255, 4, 81, 86),
    showSelectedLabels: true,
    onTap: onTap,
    items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Color.fromRGBO(130, 197, 220, 1)),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'account',
          backgroundColor: Color.fromRGBO(130, 197, 220, 1)),
      BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'community',
          backgroundColor: Color.fromRGBO(130, 197, 220, 1)),
      BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Discover',
          backgroundColor: Color.fromRGBO(130, 197, 220, 1)),
      BottomNavigationBarItem(
          icon: Icon(Icons.emergency),
          label: 'Alert',
          backgroundColor: Color.fromARGB(255, 130, 197, 220)),
    ],
  );
}
