import 'package:flutter_test_work/domain/models/places/place_reservation_area_model.dart';

class PlaceReservationDataModel {
  final int maxPeople;
  final List<String> hours;
  final List<PlaceReservationAreaModel> areas;

  const PlaceReservationDataModel({
    required this.maxPeople,
    required this.hours,
    required this.areas,
  });

  factory PlaceReservationDataModel.fromJson(Map<String, dynamic> json) {
    return PlaceReservationDataModel(
      maxPeople: json['max_people'],
      hours: List<String>.from(json['hours']),
      areas: List<PlaceReservationAreaModel>.from(
        json['areas'].map(
          (x) => PlaceReservationAreaModel.fromJson(x),
        ),
      ),
    );
  }
}
