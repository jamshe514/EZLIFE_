import 'package:flutter/material.dart';

class VisiterListOut extends StatefulWidget {
  const VisiterListOut({super.key});

  @override
  State<VisiterListOut> createState() => _VisiterListsState();
}

class _VisiterListsState extends State<VisiterListOut> {
  List<Map<String, String>> data = [
    {
      "name": "Shiva",
      "type": "Swigg",
      "room": "D-303",
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6iUVzhZCoi1gffBwqglkcayiWsNQDl-Ld3PZIDZGhEqqdljJeo4ocVt8dJGgEnkRIIa4&usqp=CAU"
    },
    {
      "name": "Raman",
      "type": "Uber",
      "room": "F-506",
      "img":
          "https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(data[index]['img']!))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0, left: 10),
                          child: Column(
                            children: [
                              Text(data[index]['name']!),
                              Text(data[index]["type"]!),
                              Text(data[index]["room"]!)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: SizedBox(
                            width: 90,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                onPressed: () {},
                                child: Text("OUT")),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
