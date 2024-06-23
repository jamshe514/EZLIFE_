 
class Floremodel {
  String floreno;
  String Flore;
  String? id;

  Floremodel({
    required this.floreno,
    required this.Flore,
    this.id,
  });

  Map<String, dynamic> toJsone(idd) => {
        'Floreno': floreno,
        'Flore': Flore,
        'id':idd,
      };

  factory Floremodel.fromjason(Map<String, dynamic> jsone) {
    return Floremodel(
      floreno: jsone['Floreno'],
      Flore: jsone['Flore'],
      id: jsone['id'],
    );
  }
}
