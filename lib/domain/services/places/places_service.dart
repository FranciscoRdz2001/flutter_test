import 'package:flutter_test_work/domain/models/places/detailed_place_model.dart';
import 'package:flutter_test_work/domain/models/places/paginated_places_model.dart';
import 'package:flutter_test_work/domain/models/places/place_model.dart';
import 'package:flutter_test_work/domain/services/base_service.dart';

class PlacesService extends BaseService {
  Future<PaginatedPlacesModel?> getPlaces({required int page}) async {
    final response = await api.getMethod<PaginatedPlacesModel>(
      endpoint: 'places/getPlacesByFilter?mode=phone&page=$page',
      mapper: (json) {
        final list = json['data'] as List;
        final data = list.map((e) => PlaceModel.fromJson(e)).toList();
        return PaginatedPlacesModel(
          places: data,
          hasMore: json['showMore'],
        );
      },
    );

    return response.data;
  }

  Future<DetailedPlaceModel?> getPlace({required int id}) async {
    final response = await api.getMethod<DetailedPlaceModel>(
      endpoint: 'places/getPlaceById/$id',
      mapper: (json) {
        return DetailedPlaceModel.fromJson(json['data']);
      },
    );

    return response.data;
  }
}
