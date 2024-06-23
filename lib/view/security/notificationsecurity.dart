import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/model/guestmodel.dart';
import 'package:demo_project/model/notificationgust.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationSecurity extends StatelessWidget {
  const NotificationSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Guest'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<HelperProvider>(
              builder: (context, instance, child) {
                return StreamBuilder(
                  stream: instance.getNotifcation(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<NotificationGust> list = [];

                    list = snapshot.data!.docs.map((e) {
                      return NotificationGust.fromjsone(
                          e.data() as Map<String, dynamic>);
                    }).toList();

                    if (snapshot.hasData) {
                      return list.isEmpty
                          ? Center(
                              child: Text('No notification found'),
                            )
                          : ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                final docid = list[index].gustid;
                                final snapshot = db
                                    .collection('Guest')
                                    .doc(docid)
                                    .snapshots();

                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: ResHelper.w(context) * .030,
                                  ),
                                  child: Material(
                                    elevation: 4,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: ResHelper.w(context) * .20,
                                      height: ResHelper.h(context) * .180,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          StreamBuilder(
                                            stream: snapshot,
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              }
                                              var data = snapshot.data!.data()
                                                  as Map<String, dynamic>;

                                              return Container(
                                                width:
                                                    ResHelper.w(context) * .30,
                                                height:
                                                    ResHelper.h(context) * .30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      data['guestimage'],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          Text(list[index].msg),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 40,
                                );
                              },
                            );
                    }

                    return Container();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
