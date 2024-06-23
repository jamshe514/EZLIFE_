class Usermodel {
  String username;
  String phonenumber;
  String email;
  String password;
  String userprofileimg;
  String rooomnumber;
  String usertype;
  String? id;
  String uid;

  String florenumber;

  Usermodel({
    required this.username,
    required this.phonenumber,
    required this.email,
    required this.password,
    required this.userprofileimg,
    required this.rooomnumber,
    required this.usertype,
    this.id,
    required this.uid,
    required this.florenumber,
  });

  Map<String, dynamic> tojsone(idd) => {
        'username':username,
        'phonenumber':phonenumber,
        'email': email,
        'password': password,
        'userprofileimg': userprofileimg,
        'roomnumber': rooomnumber,
        'usertype': usertype,
        'id': idd,
        'uid': uid,
        'flore': florenumber
      };

  factory Usermodel.fromjsone(Map<String, dynamic> json) {
    return Usermodel(
      username: json['username'],
      phonenumber: json['phonenumber'],
      email: json['email'],
      password: json['password'],
      userprofileimg: json['userprofileimg'],
      rooomnumber: json['roomnumber'],
      usertype: json['usertype'],
      id: json['id'],
      uid: json['uid'],
      florenumber: json['flore'],
    );
  }
}
