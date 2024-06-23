class NotificationGust {
  String msg;
  String? id;
  String gustid;

  NotificationGust({
    required this.msg,
    required this.gustid,
    this.id,
  });

  Map<String, dynamic> tojsone(idd) => {
        'Msg': msg,
        'id': idd,
        'gustid': gustid,
      };

  factory NotificationGust.fromjsone(Map<String, dynamic> jsone) {
    return NotificationGust(
      msg: jsone['Msg'],
      id: jsone['id'],
      gustid: jsone['gustid'],
    );
  }
}
