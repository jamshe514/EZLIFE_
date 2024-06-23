class GuestModel {
  String guestname;
  String phonenumber;
  String roomnumber;
  String nofpeople;
  String vehiclenumber;
  String? id;
  String image;
  String status;
  String florenumber;
  String typeguest;
  String date;

  GuestModel({
    required this.guestname,
    required this.phonenumber,
    required this.roomnumber,
    required this.nofpeople,
    required this.vehiclenumber,
    required this.image,
    this.id,
    required this.status,
    required this.florenumber,
    required this.typeguest,
    required this.date,
  });

  Map<String, dynamic> tojsone(idd) => {
        'guestname': guestname,
        'phonenumber': phonenumber,
        'roomnumber': roomnumber,
        'no.ofpeople': nofpeople,
        'vehiclenumber': vehiclenumber,
        'guestimage': image,
        'id': idd,
        'Status': status,
        'florenumber': florenumber,
        'typequst': typeguest,
        'Date': date,
      };
  factory GuestModel.fromjsone(Map<String, dynamic> json) {
    return GuestModel(
      guestname: json['guestname'],
      phonenumber: json['phonenumber'],
      roomnumber: json['roomnumber'],
      nofpeople: json['no.ofpeople'],
      vehiclenumber: json['vehiclenumber'],
      image: json['guestimage'],
      id: json['id'],
      status: json['Status'],
      florenumber: json['florenumber'],
      typeguest: json['typequst'],
      date: json['Date'],
    );
  }
}
