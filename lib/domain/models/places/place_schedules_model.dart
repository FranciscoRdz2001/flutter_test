class PlaceSchedulesModel {
  final String weekday;
  final String start;
  final String end;

  const PlaceSchedulesModel({
    required this.weekday,
    required this.start,
    required this.end,
  });

  factory PlaceSchedulesModel.fromJson(Map<String, dynamic> json) {
    return PlaceSchedulesModel(
      weekday: json['weekday'],
      start: json['start'],
      end: json['end'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weekday': weekday,
      'start': start,
      'end': end,
    };
  }
}
