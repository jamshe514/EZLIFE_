 
class SendGuestModel {
  String gesuname;
  String image;
  String? id;

  SendGuestModel({
    required this.gesuname,
    required this.image,
    this.id,
  });

  Map<String, dynamic> tojsone(idd) => {
        'gustname': gesuname,
        'image': image,
        'id': idd,
      };

  factory SendGuestModel.fromjsone(Map<String, dynamic> jsone) {
    return SendGuestModel(
      gesuname: jsone['gustname'],
      image: jsone['image'],
      id: jsone['idd'],
    );
  }
}
