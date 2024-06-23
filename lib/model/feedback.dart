class feedbackuser {
  String msg;
  String uid;
  String? id;

  feedbackuser({
    required this.msg,
    required this.uid,
    this.id,
  });

  Map<String, dynamic> tojsone(idd) => {
        'msg': msg,
        'uid': uid,
        'id': idd,
      };

  factory feedbackuser.fromjosne(Map<String, dynamic> json) {
    return feedbackuser(
      msg: json['msg'],
      uid: json['uid'],
      id: json['id'],
    );
  }
}
