class BookModel {
  String RoomeNo;
  // String From;
  String to;
  String Date;
  String Type;
  // String? id;
  String selecflore;

  BookModel({
    required this.RoomeNo,
    // required this.From,
    required this.to,
    required this.Type,
    required this.Date,
    required this.selecflore,
    // this.id,
  });

  Map<String, dynamic> toJsone( ) => {
        'Roomno': RoomeNo,
        // 'From': From,
        'To': to,
        'Date': Date,
        'Type': Type,
        'selectedflore': selecflore,
        // 'id': id,
      };

  factory BookModel.fromJason(Map<String, dynamic> json) {
    return BookModel(
        RoomeNo: json['Roomno'],
        // From: json['From'],
        to: json['To'],
        Date: json['Date'],
        selecflore: json['selectedflore'],
        Type: json['Type'],
        // id: json['id']
        );
  }
}
