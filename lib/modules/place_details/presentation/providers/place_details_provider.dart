import 'package:flutter_test_work/domain/models/places/detailed_place_model.dart';
import 'package:flutter_test_work/domain/services/services.dart';
import 'package:flutter_test_work/providers/screen_data_provider.dart';

class PlaceDetailsProvider extends ScreenDataProvider<DetailedPlaceModel> {
  final _service = PlacesService();

  @override
  Future<DetailedPlaceModel?> callService([int? id]) async {
    if (id == null) return null;
    return await _service.getPlace(id: id);
  }

  @override
  Future<void> getData({bool withPagination = false, int? id}) async {
    if (id == null) return;
    data = null;
    state = ScreenState.loading;
    data = await callService(id);
    state = data != null ? ScreenState.loaded : ScreenState.error;
  }
}
