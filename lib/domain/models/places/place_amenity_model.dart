class PlaceAmenityModel {
  final int id;
  final String name;
  final String? icon;

  const PlaceAmenityModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory PlaceAmenityModel.fromJson(Map<String, dynamic> json) {
    return PlaceAmenityModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
    };
  }
}
