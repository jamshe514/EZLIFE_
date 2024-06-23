import 'package:flutter/material.dart';

class third_payment extends StatefulWidget {
  const third_payment({super.key});

  @override
  State<third_payment> createState() => _third_paymentState();
}

class _third_paymentState extends State<third_payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("payment")),
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
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: 280,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Text(
                          "Google Pay",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("assets/gpay.png"),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: 280,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "Phone Pay",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage("assets/PhonePe-_ED.jpg"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: 280,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "paytm",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage("assets/download (3).png"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: 280,
                    child: Row(
                      children: [
                        Text(
                          " Bob UPI",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/download (2).png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
