class PlaceGeolocationModel {
  final String textDirection;
  final double latitude;
  final double longitude;

  const PlaceGeolocationModel({
    required this.textDirection,
    required this.latitude,
    required this.longitude,
  });

  factory PlaceGeolocationModel.fromJson(Map<String, dynamic> json) {
    return PlaceGeolocationModel(
      textDirection: json['text_direction'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text_direction': textDirection,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
