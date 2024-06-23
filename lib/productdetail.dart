import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class productdetail extends StatefulWidget {
  const productdetail({super.key});

  @override
  State<productdetail> createState() => _productdetailState();
}

class _productdetailState extends State<productdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Buy/Sell")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 480,
                width: 350,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Used Laptop",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HP",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "512 GB",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "8 GB ROM ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "SSD",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/LAP.png",
                          scale: 2,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          " in more detail ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Chat with Me",
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text(
                                "RS 22000",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 140,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chat,
                                    size: 35,
                                  )),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 45,
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 25, 103, 113),
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: Text("Buy Now")),
              )
            ],
          ),
        ));
  }
}
