class PanicAlert {
  String description;
  String uid;
  String? id;

  PanicAlert({
    required this.description,
    required this.uid,
    this.id,
  });

  Map<String, dynamic> tojson(idd) => {
        'Description': description,
        'uid': uid,
        'id': idd,
      };

  factory PanicAlert.fromjsone(Map<String, dynamic> jsone) {
    return PanicAlert(
      description: jsone['Description'],
      uid: jsone['uid'],
      id: jsone['id'],
    );
  }
}
