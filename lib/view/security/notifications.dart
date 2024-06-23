import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Notification",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 300,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name: Sithu"),
                                const SizedBox(height: 10),
                                Text("Phone No: 2345876905"),
                                const SizedBox(height: 10),
                                Text("Vehicle No: 34E67"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Time: 11:00am"),
                                const SizedBox(height: 1),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    width: 130,
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 43, 246, 74),
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: const Text("Allow In"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "View More",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
