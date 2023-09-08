class PlaceCategoryModel {
  final int id;
  final String name;
  final String url;
  final String imgUrl;
  final String? info;

  const PlaceCategoryModel({
    required this.id,
    required this.name,
    required this.url,
    required this.imgUrl,
    required this.info,
  });

  factory PlaceCategoryModel.fromJson(Map<String, dynamic> json) {
    return PlaceCategoryModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      imgUrl: json['img_url'],
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'img_url': imgUrl,
      'info': info,
    };
  }
}
