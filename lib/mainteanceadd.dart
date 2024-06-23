import 'package:demo_project/maintenance.dart';
import 'package:flutter/material.dart';

class mainteanceadd extends StatefulWidget {
  const mainteanceadd({super.key});

  @override
  State<mainteanceadd> createState() => _mainteanceaddState();
}

class _mainteanceaddState extends State<mainteanceadd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Maintenance")),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
      ), 
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //width: double.infinity,
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
                height: 35,
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Unit No",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: 320,
                child: Padding(
                  padding: const EdgeInsets.only(
                      //right: 200,
                      ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2, top: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Issue:Plumming Issue",
                            style: TextStyle(fontSize: 18)),
                        Text("Date:22/12/2024", style: TextStyle(fontSize: 18)),
                        Text("Unit No:A-109 ", style: TextStyle(fontSize: 18)),
                        //Text("To :12am ", style: TextStyle(fontSize: 18))
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                            ),
                            Text(
                              "Pending",
                              style: TextStyle(fontSize: 15, color: Colors.red),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400, left: 270),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => maintenance())));
                    },
                    icon: Icon(
                      Icons.add,
                      size: 55,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
