import 'package:flutter_test_work/domain/models/places/place_amenity_model.dart';
import 'package:flutter_test_work/domain/models/places/place_category_model.dart';
import 'package:flutter_test_work/domain/models/places/place_closer_place_model.dart';
import 'package:flutter_test_work/domain/models/places/place_geolocation_model.dart';
import 'package:flutter_test_work/domain/models/places/place_image_model.dart';
import 'package:flutter_test_work/domain/models/places/place_review_model.dart';
import 'package:flutter_test_work/domain/models/places/place_schedules_model.dart';

class DetailedPlaceModel {
  final int id;
  final String slug;
  final bool isLite;
  final bool isClassic;
  final bool isFavorite;
  final bool isAmex;
  final bool hasDelivery;
  final int reservable;
  final List<dynamic> reservations;
  final String name;
  final String description;
  final String mainImg;
  final String logoImg;
  final List<PlaceImageModel> gallery;
  final String rangePrice;
  final bool status;
  final List<PlaceSchedulesModel> schedules;
  final List<PlaceCategoryModel> categories;
  final List<PlaceAmenityModel> amenities;
  final String? dressCode;
  final PlaceReviewModel reviews;
  final PlaceGeolocationModel geolocation;
  final List<PlaceCloserPlaceModel> closerPlaces;

  const DetailedPlaceModel({
    required this.id,
    required this.slug,
    required this.isLite,
    required this.isClassic,
    required this.isFavorite,
    required this.isAmex,
    required this.hasDelivery,
    required this.reservable,
    required this.reservations,
    required this.name,
    required this.description,
    required this.mainImg,
    required this.logoImg,
    required this.gallery,
    required this.rangePrice,
    required this.status,
    required this.schedules,
    required this.categories,
    required this.amenities,
    required this.dressCode,
    required this.reviews,
    required this.geolocation,
    required this.closerPlaces,
  });

  factory DetailedPlaceModel.fromJson(Map<String, dynamic> json) {
    return DetailedPlaceModel(
      id: json['id'],
      slug: json['slug'],
      isLite: json['is_lite'],
      isClassic: json['is_classic'],
      isFavorite: json['is_favorite'],
      isAmex: json['is_amex'],
      hasDelivery: json['has_delivery'],
      reservable: json['reservable'],
      reservations: List<dynamic>.from(json['reservations']),
      name: json['name'],
      description: json['description'],
      mainImg: json['main_img'],
      logoImg: json['logo_img'],
      gallery: List<PlaceImageModel>.from(
        json['gallery'].map(
          (x) => PlaceImageModel.fromJson(x),
        ),
      ),
      rangePrice: json['range_price'],
      status: json['status'],
      schedules: List<PlaceSchedulesModel>.from(
        json['schedules'].map(
          (x) => PlaceSchedulesModel.fromJson(x),
        ),
      ),
      categories: List<PlaceCategoryModel>.from(
        json['categories'].map(
          (x) => PlaceCategoryModel.fromJson(x),
        ),
      ),
      amenities: List<PlaceAmenityModel>.from(
        json['amenities'].map(
          (x) => PlaceAmenityModel.fromJson(x),
        ),
      ),
      dressCode: json['dress_code'],
      reviews: PlaceReviewModel.fromJson(json['reviews']),
      geolocation: PlaceGeolocationModel.fromJson(json['geolocation']),
      closerPlaces: List<PlaceCloserPlaceModel>.from(
        json['closer_places'].map(
          (x) => PlaceCloserPlaceModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'is_lite': isLite,
      'is_classic': isClassic,
      'is_favorite': isFavorite,
      'is_amex': isAmex,
      'has_delivery': hasDelivery,
      'reservable': reservable,
      'reservations': reservations,
      'name': name,
      'description': description,
      'main_img': mainImg,
      'logo_img': logoImg,
      'gallery': gallery.map((x) => x.toJson()).toList(),
      'range_price': rangePrice,
      'status': status,
      'schedules': schedules.map((x) => x.toJson()).toList(),
      'categories': categories.map((x) => x.toJson()).toList(),
      'amenities': amenities.map((x) => x.toJson()).toList(),
      'dress_code': dressCode,
      'reviews': reviews.toJson(),
      'geolocation': geolocation.toJson(),
      'closer_places': closerPlaces.map((x) => x.toJson()).toList(),
    };
  }
}
