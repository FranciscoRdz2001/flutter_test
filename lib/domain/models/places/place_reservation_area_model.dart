class PlaceReservationAreaModel {
  final String name;
  final bool value;
  final bool selected;

  const PlaceReservationAreaModel({
    required this.name,
    required this.value,
    required this.selected,
  });

  factory PlaceReservationAreaModel.fromJson(Map<String, dynamic> json) {
    return PlaceReservationAreaModel(
      name: json['name'],
      value: json['value'],
      selected: json['selected'],
    );
  }
}
