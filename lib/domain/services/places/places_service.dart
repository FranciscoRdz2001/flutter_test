import 'package:flutter_test_work/domain/models/places/place_model.dart';
import 'package:flutter_test_work/domain/services/base_service.dart';

class PlacesService extends BaseService {
  Future<PlaceModel?> getPlaces() async {
    final response = await api.getMethod<PlaceModel>(
      mapper: (json) => PlaceModel.fromJson(json),
      endpoint: 'places',
    );

    return response.data;
  }
}
