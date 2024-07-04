import 'package:demo_project/feedback.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/model/feedback.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackViewAdmin extends StatelessWidget {
  const FeedbackViewAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/view.jpg'))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ResHelper.h(context) * .020,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ALL FEED BACK',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: ResHelper.w(context) * .050,
                  ),
                ),
              ],
            ),
            Consumer<HelperProvider>(
              builder: (context, helper, child) {
                return StreamBuilder(
                  stream: helper.Getfeedback(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    List<feedbackuser> list = [];
                    list = snapshot.data!.docs.map((e) {
                      return feedbackuser
                          .fromjosne(e.data() as Map<String, dynamic>);
                    }).toList();

                    if (snapshot.hasData) {
                      return list.isEmpty
                          ? Center(
                              child: Text('no feedback'),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ResHelper.w(context) * .20),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: ResHelper.w(context) * .10,
                                    height: ResHelper.h(context) * .20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ResHelper.w(context) * .010),
                                      color: Colors.blueGrey,
                                    ),
                                    child: Row(
                                      children: [
                                        Text('MESSAGE :${list[index].msg}')
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: ResHelper.h(context) * .020,
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
    ));
  }
}
