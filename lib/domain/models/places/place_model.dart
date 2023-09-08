class PlaceModel {
  final int id;
  final String url;
  final bool status;
  final bool isFavorite;
  final int isLite;
  final int isClassic;
  final bool isAmex;
  final bool hasDelivery;
  final String imageUrl;
  final String logoUrl;
  final String name;
  final String shortName;
  final String mainCategory;
  final String scheduleTime;
  final double score;
  final String priceRange;
  final String location;

  const PlaceModel({
    required this.id,
    required this.url,
    required this.status,
    required this.isFavorite,
    required this.isLite,
    required this.isClassic,
    required this.isAmex,
    required this.hasDelivery,
    required this.imageUrl,
    required this.logoUrl,
    required this.name,
    required this.shortName,
    required this.mainCategory,
    required this.scheduleTime,
    required this.score,
    required this.priceRange,
    required this.location,
  });

  factory PlaceModel.fromJson(dynamic json) {
    return PlaceModel(
      id: json['id'],
      url: json['url'],
      status: json['status'],
      isFavorite: json['is_favorite'],
      isLite: json['is_lite'],
      isClassic: json['is_classic'],
      isAmex: json['is_amex'],
      hasDelivery: json['has_delivery'],
      imageUrl: json['image_url'],
      logoUrl: json['logo_url'],
      name: json['name'],
      shortName: json['short_name'],
      mainCategory: json['main_category'],
      scheduleTime: json['schedule_time'],
      score: json['score'],
      priceRange: json['price_range'],
      location: json['location'],
    );
  }
}
