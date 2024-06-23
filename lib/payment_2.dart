import 'package:flutter/material.dart';

class second_payment extends StatefulWidget {
  const second_payment({super.key});

  @override
  State<second_payment> createState() => _second_paymentState();
}

class _second_paymentState extends State<second_payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("payment")),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
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
            Text(
              "Pay dues in this month",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 350,
              width: 350,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 100),
                    child: Text(
                      "last date:3/3/2024",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200, top: 250),
                    child: Text(
                      "Rs 7000",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: SizedBox(
                      height: 45,
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (Color(0xFF27ABC2)),
                            foregroundColor: (Colors.black)),
                        onPressed: () {},
                        child: Text("Pay"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
