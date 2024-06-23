class ScurityModel {
  String name;
  String email;
  String phone;

  String? id;

  ScurityModel(
      {required this.name, required this.email, required this.phone, this.id});

  Map<String, dynamic> data(docId) =>
      {"name": name, "email": email, "phone": phone, "id": docId};

  factory ScurityModel.fromData(Map<String, dynamic> i) {
    return ScurityModel(
      name: i["name"],
      email: i["email"],
      phone: i["phone"],
    );
  }
}
