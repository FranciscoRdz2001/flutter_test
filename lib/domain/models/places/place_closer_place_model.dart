class PlaceCloserPlaceModel {
  final int id;
  final String name;
  final String url;
  final String imgUrl;
  final String address;
  final double score;
  final double distance;

  const PlaceCloserPlaceModel({
    required this.id,
    required this.name,
    required this.url,
    required this.imgUrl,
    required this.address,
    required this.score,
    required this.distance,
  });

  factory PlaceCloserPlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceCloserPlaceModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      imgUrl: json['img_url'],
      address: json['address'],
      score: double.parse(json['score']),
      distance: json['distance'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'img_url': imgUrl,
      'address': address,
      'score': score,
      'distance': distance,
    };
  }
}
