import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityModel {
  String postname;
  String postimage;
  String postDiscription;
  String? id;
  String uid;
  Timestamp timestamp;

  CommunityModel({
    required this.postname,
    required this.postimage,
    required this.postDiscription,
    this.id,
    required this.uid,
    required this.timestamp,
  });

  Map<String, dynamic> tojsone(idd) => {
        'postname': postname,
        'postimage': postimage,
        'postdiscription': postDiscription,
        'id': idd,
        'uid': uid,
        'timestamp': timestamp,
      };

  factory CommunityModel.fromjasone(Map<String, dynamic> jsone) {
    return CommunityModel(
      postname: jsone['postname'],
      postimage: jsone['postimage'],
      postDiscription: jsone['postdiscription'],
      id: jsone['id'],
      uid: jsone['uid'],
      timestamp: jsone['timestamp'],
    );
  }
}
