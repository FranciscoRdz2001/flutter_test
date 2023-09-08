import 'dart:developer';

import 'package:flutter_test_work/domain/models/places/place_model.dart';
import 'package:flutter_test_work/domain/services/base_service.dart';

class PlacesService extends BaseService {
  Future<List<PlaceModel>?> getPlaces() async {
    // final response = await api.getMethod<PlaceModel>(
    //   mapper: (json) => PlaceModel.fromJson(json),
    //   endpoint: 'places',
    // );

    // return response.data;
    log('Getting places...');
    await Future.delayed(const Duration(seconds: 2));
    log('Places received!');
    final json = <String, dynamic>{
      "status": 200,
      "message": "success",
      "page": null,
      "showMore": true,
      "data": [
        {
          "id": 3893,
          "url": "restaurant-gallery-luz-de-luna-campeche",
          "status": true,
          "is_favorite": false,
          "is_lite": 0,
          "is_classic": 0,
          "is_amex": false,
          "has_delivery": false,
          "image_url":
              "https://reservandonos-cdn.s3-us-west-2.amazonaws.com/place/3893/cover/restaurant-gallery-luz-de-luna-campeche-reserva-reservandonos-33.jpg",
          "logo_url":
              "https://reservandonos-cdn.s3-us-west-2.amazonaws.com/place/3893/cover/restaurant-gallery-luz-de-luna-campeche-reserva-reservandonos-33.jpg",
          "name": "Restaurant & Gallery Luz de Luna Campeche",
          "shortName": "Restaurant & Gallery Luz de Luna Cam...",
          "main_category": null,
          "categories": "Restaurantes",
          "schedule": "13:00 - 23:00",
          "score": 0,
          "price_range": "\$100 - \$200",
          "location": "Campeche, Campeche"
        },
        {
          "id": 3892,
          "url": "restaurante-maria-sirena-azcapotzalco",
          "status": false,
          "is_favorite": false,
          "is_lite": 0,
          "is_classic": 0,
          "is_amex": false,
          "has_delivery": false,
          "image_url":
              "https://reservandonos-cdn.s3-us-west-2.amazonaws.com/place/3892/cover/restaurante-maria-sirena-azcapotzalco-reserva-reservandonos-4.jpg",
          "logo_url":
              "https://reservandonos-cdn.s3-us-west-2.amazonaws.com/place/3892/logo-square/restaurante-maria-sirena-azcapotzalco-reserva-reservandonos-5.jpg",
          "name": "Restaurante María Sirena Azcapotzalco",
          "shortName": "Restaurante María Sirena Azcapotzalc...",
          "main_category": null,
          "categories": "Restaurantes",
          "schedule": "11:30 - 20:00",
          "score": 0,
          "price_range": "\$150 - \$300",
          "location": "Azcapotzalco, Ciudad de México"
        },
        {
          "id": 3891,
          "url": "restaurante-bay-park-limon",
          "status": false,
          "is_favorite": false,
          "is_lite": 0,
          "is_classic": 0,
          "is_amex": false,
          "has_delivery": false,
          "image_url":
              "https://reservandonos-cdn.s3-us-west-2.amazonaws.com/place/3891/cover/restaurante-bay-park-limon-reserva-reservandonos-4.jpeg",
          "logo_url":
              "https://reservandonos-cdn.s3-us-west-2.amazonaws.com/place/3891/logo-square/restaurante-bay-park-limon-reserva-reservandonos-1.jpg",
          "name": "Restaurante Bay Park Limón",
          "shortName": "Restaurante Bay Park Limón",
          "main_category": null,
          "categories": "Restaurantes",
          "schedule": "12:00 - 22:00",
          "score": 0,
          "price_range": "\$3000 - \$45000",
          "location": "Limon, Limon"
        }
      ]
    };

    final list = json['data'] as List<Map<String, dynamic>>;
    return list.map((e) => PlaceModel.fromJson(e)).toList();
  }
}
