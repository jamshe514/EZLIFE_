class UploadCharge {
  int monthlerent;
  int maintance;
  int utility;
  String flore;
  String room;
  String? id;

  UploadCharge({
    required this.monthlerent,
    required this.maintance,
    required this.utility,
    required this.flore,
    required this.room,
    this.id,
  });

  Map<String, dynamic> tojsone(idd) => {
        'MonthlyRent': monthlerent,
        'Maintance': maintance,
        'Utility': utility,
        'Flore': flore,
        'Room': room,
        'id': idd,
      };
  // factory UploadCharge.fromjsone(Map<String, dynamic> jsone) {
  //   return UploadCharge(
  //     monthlerent: int.parse(jsone['MonthlyRent']),
  //     maintance: int.parse(jsone['Maintance']),
  //     utility: int.parse(jsone['Utility']),
  //     flore: jsone['Flore'],
  //     room: jsone['Room'],
  //     id: jsone['id'],
  //   );
  // }

  factory UploadCharge.fromjsone(Map<String, dynamic> jsone) {
    return UploadCharge(
      monthlerent: jsone['MonthlyRent'] is int
          ? jsone['MonthlyRent']
          : int.parse(jsone['MonthlyRent']),
      maintance: jsone['Maintance'] is int
          ? jsone['Maintance']
          : int.parse(jsone['Maintance']),
      utility: jsone['Utility'] is int
          ? jsone['Utility']
          : int.parse(jsone['Utility']),
      flore: jsone['Flore'],
      room: jsone['Room'],
      id: jsone['id'],
    );
  }
}
