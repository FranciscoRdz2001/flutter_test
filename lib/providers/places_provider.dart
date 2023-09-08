import 'package:flutter_test_work/domain/models/places/place_model.dart';
import 'package:flutter_test_work/domain/services/services.dart';
import 'package:flutter_test_work/providers/screen_data_provider.dart';

class PlacesProvider extends ScreenDataProvider<PlaceModel> {
  final _service = PlacesService();

  @override
  Future<PlaceModel?> callService() {
    return _service.getPlaces();
  }
}
