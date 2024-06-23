class Securitymodel {
  String securityName;
  String securityEmail;
  String securityphonenumber;
  String securityPassword;
  String securityprofile;
  String? id;
  String uid;

  Securitymodel({
    required this.securityName,
    required this.securityEmail,
    required this.securityphonenumber,
    required this.securityPassword,
    this.id,
    required this.uid,
    required this.securityprofile,
  });

  Map<String, dynamic> tojsone(idd) => {
        'SecurityName': securityName,
        'SecurityEmail': securityEmail,
        'Securityphonenumber': securityphonenumber,
        'Securitypassword': securityPassword,
        'securityprofile':securityprofile,
        'id': idd,
        'uid': uid,
      };

  factory Securitymodel.fromjsone(Map<String, dynamic> jsone) {
    return Securitymodel(
      securityName: jsone['SecurityName'],
      securityEmail: jsone['SecurityEmail'],
      securityphonenumber: jsone['Securityphonenumber'],
      securityPassword: jsone['Securitypassword'],
      securityprofile: jsone['securityprofile'],
      uid: jsone['uid'],
      id: jsone['id'],
    );
  }
}
