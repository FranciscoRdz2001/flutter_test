import 'package:flutter_test_work/domain/models/places/place_reservation_data_model.dart';

class PlaceReservationModel {
  final DateTime date;
  final PlaceReservationDataModel data;

  const PlaceReservationModel({
    required this.date,
    required this.data,
  });

  factory PlaceReservationModel.fromJson(Map<String, dynamic> json) {
    return PlaceReservationModel(
      date: DateTime.parse(json['date']),
      data: PlaceReservationDataModel.fromJson(json['data']),
    );
  }
}
