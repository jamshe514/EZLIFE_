import 'dart:convert';

class Paymentstatus {
  String name;
  String uid;
  String status;
  String date;

  Paymentstatus({
    required this.name,
    required this.uid,
    required this.status,
    required this.date,
  });

  Map<String, dynamic> toJsone() => {
        'name': name,
        'uid': uid,
        'status': status,
        'Date':date,
      };

  factory Paymentstatus.fromJsone(Map<String, dynamic> Json) {
    return Paymentstatus(
      name: Json['name'],
      uid: Json['uid'],
      status: Json['status'],
      date: Json['Date']
    );
  }
}
