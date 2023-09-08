class PlaceImageModel {
  final int id;
  final String file;

  const PlaceImageModel({
    required this.id,
    required this.file,
  });

  factory PlaceImageModel.fromJson(Map<String, dynamic> json) {
    return PlaceImageModel(
      id: json['id'],
      file: json['file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file': file,
    };
  }
}
