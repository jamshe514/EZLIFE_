class ActivityModel {
  String Activity_name;
  String Activiy_Goals;
  String Venue;
  String From;
  String to;
  String Date;

  int? id;

  ActivityModel({
    required this.Activity_name,
    required this.Activiy_Goals,
    required this.Venue,
    required this.From,
    required this.to,
    required this.Date,
  });

  Map<String, dynamic> toJsone(id) => {
        'Activity name': Activity_name,
        'Activity Gols': Activiy_Goals,
        'Venue': Venue,
        'From': From,
        'To': to,
        'Date': Date,
      };

  factory ActivityModel.fromJason(Map<String, dynamic> json) {
    return ActivityModel(
      Activity_name: json['Activity name'],
      Activiy_Goals: json['Activity Gols'],
      Venue: json['Venue'],
      From: json['From'],
      to: json['To'],
      Date: json['Date'],
    );
  }
}
