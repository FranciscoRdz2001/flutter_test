import 'package:flutter_test_work/domain/models/places/place_model.dart';
import 'package:flutter_test_work/domain/services/services.dart';
import 'package:flutter_test_work/providers/screen_data_provider.dart';

class PlacesProvider extends ScreenDataProvider<List<PlaceModel>> {
  final _service = PlacesService();

  @override
  Future<List<PlaceModel>?> callService() async {
    return await _service.getPlaces();
  }
}
