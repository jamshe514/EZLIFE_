import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/helpers.dart';
import 'package:demo_project/home_user.dart';
import 'package:demo_project/model/comment.dart';
import 'package:demo_project/model/communitypost_model.dart';
import 'package:demo_project/model/likepost.dart';
import 'package:demo_project/controller/helperprovider.dart';
import 'package:demo_project/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialNetwork extends StatefulWidget {
  const SocialNetwork({super.key});

  @override
  State<SocialNetwork> createState() => _SocialNetworkState();
}

class _SocialNetworkState extends State<SocialNetwork> {
  final formkey = GlobalKey<FormState>();
  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Post'),
          content: Consumer<HelperProvider>(
            builder: (context, helper, child) {
              return Container(
                // height: ResHelper.h(context) / 2,
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                    width: ResHelper.w(context) * .40,
                                    height: ResHelper.w(context) * .30,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: ResHelper.w(context) * .40,
                                          height: ResHelper.w(context) * .25,
                                          // color: Colors.red,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            shape: BoxShape.circle,
                                            image: helper.image != null
                                                ? DecorationImage(
                                                    image: FileImage(
                                                      helper.image!,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                        ),
                                        Positioned(
                                          left: ResHelper.w(context) * .27,
                                          top: ResHelper.w(context) * .15,
                                          child: IconButton(
                                            onPressed: () async {
                                              await helper.imagegallery();
                                            },
                                            icon:
                                                Icon(Icons.camera_alt_outlined),
                                          ),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: ResHelper.h(context) * .010,
                                ),
                                SizedBox(
                                  width: ResHelper.w(context) * .50,
                                  height: ResHelper.w(context) * .25,
                                  child: TextFormField(
                                    controller: helper.postname,
                                    decoration: InputDecoration(
                                      hintText: 'post user name',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'requred';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: ResHelper.h(context) * .010,
                                ),
                                SizedBox(
                                  width: ResHelper.w(context) * .50,
                                  height: ResHelper.w(context) * .25,
                                  child: TextFormField(
                                    controller: helper.postdiscrptn,
                                    decoration: InputDecoration(
                                      hintText: 'post discription',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'requred';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: ResHelper.h(context) * .010,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {
                                      helper.imagepicker(helper.image);
                                      if (helper.image != null) {
                                        cherrytoast(
                                            context, 'please select image');
                                      }
                                      if (helper.urllink != null) {
                                        helper
                                            .addPost(
                                          CommunityModel(
                                              postname: helper.postname.text,
                                              postimage:
                                                  helper.urllink.toString(),
                                              postDiscription:
                                                  helper.postdiscrptn.text,
                                              uid: auth.currentUser!.uid,
                                              timestamp: Timestamp.now()),
                                        )
                                            .then((value) {
                                          helper.clar();
                                          Navigator.pop(context);
                                          cherrytoast(
                                              context, 'add post succes');
                                        });
                                        log(auth.currentUser!.uid);
                                      } else {
                                        cherrytoast(
                                            context, 'filed to upload image');
                                      }
                                      helper.clar();
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: ResHelper.w(context) * .40,
                                    height: ResHelper.w(context) * .10,
                                    // color: Colors.red,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                    ),
                                    child: Text('ADD POST'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bottomchat() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    child: Row(
                      children: [Text('Hai')],
                    ),
                  ),
                );
              },
            ));
      },
    );
  }

  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("community")),
        backgroundColor: Color.fromARGB(44, 24, 255, 216),
        actions: [
          IconButton(
              onPressed: () {
                showMyDialog();
              },
              icon: Icon(Icons.add))
        ],
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
          child: Consumer<HelperProvider>(
            builder: (context, helper, child) {
              return StreamBuilder(
                stream: helper.allpost(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<CommunityModel> list = [];

                  list = snapshot.data!.docs.map((e) {
                    return CommunityModel.fromjasone(
                        e.data() as Map<String, dynamic>);
                  }).toList();

                  if (snapshot.hasData) {
                    return list.isEmpty
                        ? Center(
                            child: Text('no post '),
                          )
                        : ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              final uid = list[index].uid;

                              return Container(
                                color: Colors.white,
                                // height: 300,
                                width: 250,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              //  right: 250,
                                              left: 10,
                                              top: 10,
                                            ),
                                            child: Consumer<HelperProvider>(
                                              builder:
                                                  (context, helper, child) {
                                                return FutureBuilder(
                                                  future:
                                                      helper.getSingleuser(uid),
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return CircularProgressIndicator();
                                                    }
                                                    final datasingle =
                                                        helper.singleuser;
                                                    return Container(
                                                      width: 50,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        // color: Colors.red,
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            datasingle!
                                                                .userprofileimg,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              list[index].postname,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            // Text("A-101")
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 180),
                                      child: Text(
                                        list[index].postDiscription,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: ResHelper.w(context) * .80,
                                            height: ResHelper.w(context) * .50,
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                            ),
                                            child: Image.network(
                                              fit: BoxFit.cover,
                                              list[index].postimage,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        FutureBuilder(
                                          future: helper.fetchLikedpost(
                                              auth.currentUser!.uid +
                                                  list[index].id.toString()),
                                          builder: (context, snapshot) {
                                            return IconButton(
                                              onPressed: () {
                                                helper.likepost(
                                                    LikePostModel(
                                                        likedUid: auth
                                                            .currentUser!.uid,
                                                        postId: list[index]
                                                            .id
                                                            .toString()),
                                                    auth.currentUser!.uid +
                                                        list[index]
                                                            .id
                                                            .toString());
                                              },
                                              icon: Icon(
                                                helper.isliked == true
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                            );
                                          },
                                        ),
                                        Text(
                                          "like",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showBottomSheet(
                                              context: context,
                                              builder: (context) =>
                                                  DraggableScrollableSheet(
                                                snapSizes: const [
                                                  .3,
                                                  .5,
                                                  .7,
                                                ],
                                                snap: true,
                                                expand: false,

                                                // initialChildSize:
                                                //     0.8,
                                                // minChildSize: 0.7,
                                                // maxChildSize: .9,
                                                builder: (context,
                                                    scrollController) {
                                                  return Consumer<
                                                      HelperProvider>(
                                                    builder: (context,
                                                        commentController,
                                                        child) {
                                                      return Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 10),
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20)),
                                                          color: Color.fromARGB(
                                                              255,
                                                              104,
                                                              104,
                                                              104),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              height: 5,
                                                              width: 50,
                                                              decoration: const BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          48,
                                                                          48,
                                                                          48)),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            const Text(
                                                              "Comments",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          152,
                                                                          152,
                                                                          152)),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    _commentController,
                                                                decoration: InputDecoration(
                                                                    suffix: IconButton(
                                                                        onPressed: () {
                                                                          if (_commentController
                                                                              .text
                                                                              .isNotEmpty) {
                                                                            commentController.addComment(list[index].id, CommentModel(comment: _commentController.text, time: time, date: date, commentedUid: auth.currentUser!.uid)).then((value) {
                                                                              _commentController.clear();
                                                                            });
                                                                          }
                                                                        },
                                                                        icon: const Icon(
                                                                          CupertinoIcons
                                                                              .shift_fill,
                                                                          color:
                                                                              Colors.white,
                                                                        )),
                                                                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                                                                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                                                                    hintText: "add a comment...",
                                                                    hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey),
                                                                    // fillColor: Colors.white,
                                                                    filled: false),
                                                              ),
                                                            ),
                                                            FutureBuilder(
                                                                future: commentController
                                                                    .fetchAllComment(
                                                                        list[index]
                                                                            .id),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  if (snapshot
                                                                          .connectionState ==
                                                                      ConnectionState
                                                                          .waiting) {
                                                                    return const SizedBox();
                                                                  }
                                                                  final commentList =
                                                                      commentController
                                                                          .comments;
                                                                  return Expanded(
                                                                      child: commentList
                                                                              .isEmpty
                                                                          ? const Center(
                                                                              child: Text(
                                                                                "No Comments",
                                                                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey),
                                                                              ),
                                                                            )
                                                                          : ListView
                                                                              .builder(
                                                                              itemCount: commentList.length,
                                                                              itemBuilder: (context, index) {
                                                                                return FutureBuilder(
                                                                                    future: commentController.getSingleuser(commentList[index].commentedUid),
                                                                                    builder: (context, snapshot) {
                                                                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                                                                        return const SizedBox();
                                                                                      }
                                                                                      final userData = commentController.singleuser;
                                                                                      return ListTile(
                                                                                        leading: userData!.userprofileimg.isEmpty
                                                                                            ? const Icon(
                                                                                                CupertinoIcons.profile_circled,
                                                                                                color: Colors.white,
                                                                                                size: 30,
                                                                                              )
                                                                                            : CircleAvatar(
                                                                                                backgroundImage: NetworkImage(userData.userprofileimg),
                                                                                              ),
                                                                                        title: Text(
                                                                                          userData.email,
                                                                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
                                                                                        ),
                                                                                        subtitle: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Text(
                                                                                              commentList[index].comment,
                                                                                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                                                                                            ),
                                                                                            Text(
                                                                                              " ${commentList[index].time}",
                                                                                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    });
                                                                              },
                                                                            ));
                                                                }),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.comment,
                                            size: 30,
                                          ),
                                        ),
                                        Text(
                                          "comments",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                  }

                  return Container();
                },
              );
            },
          )),
    );
  }
}
