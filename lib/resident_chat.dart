import 'package:flutter/material.dart';

class chats extends StatefulWidget {
  const chats({super.key});

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Chats")),
          backgroundColor: Color.fromARGB(44, 24, 255, 216),
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Container(
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
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Color.fromARGB(255, 236, 234, 234),
                            borderRadius: BorderRadius.circular(10)),
                        height: 80,
                        width: 350,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CircleAvatar(
                                radius: 30,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 12),
                              child: Column(
                                children: [
                                  Text("Joss "),
                                  Text("A-101"),
                                ],
                              ),
                            ),
                            //Text("A-101"),
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.chat_outlined)),
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 80,
                        width: 350,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CircleAvatar(radius: 30),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 12),
                              child: Column(
                                children: [
                                  Text("Smith "),
                                  Text("B-101"),
                                ],
                              ),
                            ),
                            //Text("B-101"),
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.chat_outlined)),
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 80,
                        width: 350,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CircleAvatar(radius: 30),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 12),
                              child: Column(
                                children: [
                                  Text("Joss "),
                                  Text("A-101"),
                                ],
                              ),
                            ),
                            //Text("A-101"),
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.chat_outlined)),
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 80,
                      width: 350,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CircleAvatar(
                              radius: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 12),
                            child: Column(
                              children: [
                                Text("Joss "),
                                Text("A-101"),
                              ],
                            ),
                          ),
                          //Text("A-101"),
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.chat_outlined)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 80,
                                width: 350,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: CircleAvatar(
                                        radius: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 12),
                                      child: Column(
                                        children: [
                                          Text("Joss "),
                                          Text("A-101"),
                                        ],
                                      ),
                                    ),
                                    //Text("A-101"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 150),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.chat_outlined)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: InkWell(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 80,
                                    width: 350,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: CircleAvatar(
                                            radius: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 12),
                                          child: Column(
                                            children: [
                                              Text("Joss "),
                                              Text("A-101"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
