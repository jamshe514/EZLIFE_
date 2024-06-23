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
      body: SingleChildScrollView(
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
                    fontSize: ResHelper.w(context) * .020,
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
                                    width: ResHelper.w(context) * .20,
                                    height: ResHelper.h(context) * .20,
                                    color: Colors.grey,
                                    child: Row(
                                      children: [Text(list[index].msg)],
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
    );
  }
}
