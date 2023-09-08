import 'package:flutter_test_work/domain/models/places/place_model.dart';

class PaginatedPlacesModel {
  final List<PlaceModel> places;
  final bool hasMore;

  const PaginatedPlacesModel({
    required this.places,
    required this.hasMore,
  });
}
