import 'package:demo_project/model/guestmodel.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VisiterHistory extends StatefulWidget {
  const VisiterHistory({super.key});

  @override
  State<VisiterHistory> createState() => _VisiterHistoryState();
}

class _VisiterHistoryState extends State<VisiterHistory> {
  TextEditingController _dateController = TextEditingController();
  DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<HelperProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("History Gate Pass")),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.0, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                onTap: () {
                  // _selectDate(context);
                  helper.getAllgust();
                },
                onChanged: (value) {
                  helper.searchgust(value);
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _dateController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: IconButton(
                    onPressed: () {
                      // _selectDate(context);
                    },
                    icon: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'dd/mm/yyyy',
                ),
              ),
              // SizedBox(height: 30,),
              Expanded(child: Consumer<HelperProvider>(
                builder: (context, helper, child) {
                  return StreamBuilder(
                    stream: helper.getgestdata(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      List<GuestModel> guest = [];

                      guest = snapshot.data!.docs.map((e) {
                        return GuestModel.fromjsone(
                            e.data() as Map<String, dynamic>);
                      }).toList();

                      final searchlist =
                          helper.gustsearch.isEmpty ? guest : helper.gustsearch;

                      return guest.isEmpty
                          ? Center(
                              child: Text('NO GUST'),
                            )
                          : ListView.builder(
                              itemCount: searchlist.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Card(
                                    child: Container(
                                      width: double.infinity,
                                      // height: 100,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                searchlist[index].image,
                                              ))),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 17.0, left: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                    'Guest name ${searchlist[index].guestname}'),
                                                Text(
                                                    'Flore no : ${searchlist[index].florenumber}'),
                                                Text(
                                                    'Room no :${searchlist[index].roomnumber}'),
                                                Text(
                                                    'VISIT DATE :${searchlist[index].date}'),
                                              ],
                                            ),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.only(
                                          //     left: 10,
                                          //   ),
                                          //   child: SizedBox(
                                          //     width: 90,
                                          //     height: 40,
                                          //     child: ElevatedButton(
                                          //         style: ElevatedButton.styleFrom(
                                          //             backgroundColor:
                                          //                 Colors.red,
                                          //             foregroundColor:
                                          //                 Colors.black,
                                          //             shape:
                                          //                 RoundedRectangleBorder(
                                          //                     borderRadius:
                                          //                         BorderRadius
                                          //                             .zero)),
                                          //         onPressed: () {},
                                          //         child: Text("OUT")),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() => _dateController.text = _dateFormat.format(picked));
    }
  }
}
