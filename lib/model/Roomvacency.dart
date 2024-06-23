class RoomVacencyModel {
  String vecenacyflore;
  String vacencyroom;
  String? id;

  RoomVacencyModel({
    required this.vecenacyflore,
    required this.vacencyroom,
    this.id,
  });

  Map<String, dynamic> tojsone(idd) => {
        'vacencyflore': vecenacyflore,
        'vacencyroom': vacencyroom,
        'id': idd,
      };
  factory RoomVacencyModel.fromjsone(Map<String, dynamic> jsone) {
    return RoomVacencyModel(
      vecenacyflore: jsone['vacencyflore'],
      vacencyroom: jsone['vacencyroom'],
      id: jsone['id'],
    );
  }
}
