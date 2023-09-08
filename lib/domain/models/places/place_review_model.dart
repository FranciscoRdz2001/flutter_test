class PlaceReviewModel {
  final double totalScore;
  final int quantity;
  final List<int> stars;
  final bool viewMore;

  const PlaceReviewModel({
    required this.totalScore,
    required this.quantity,
    required this.stars,
    required this.viewMore,
  });

  factory PlaceReviewModel.fromJson(Map<String, dynamic> json) {
    return PlaceReviewModel(
      totalScore: double.tryParse(json['totalScore']) ?? 0,
      quantity: json['quantity'],
      stars: json['stars'].cast<int>(),
      viewMore: json['view_more'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalScore': totalScore,
      'quantity': quantity,
      'stars': stars,
      'view_more': viewMore,
    };
  }
}
