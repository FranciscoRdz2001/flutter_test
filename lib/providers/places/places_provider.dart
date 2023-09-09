import 'package:flutter_test_work/domain/models/places/place_model.dart';
import 'package:flutter_test_work/domain/services/services.dart';
import 'package:flutter_test_work/providers/screen_data_provider.dart';

/// Provider for the places page
/// This provider is used to get the data for the places page
/// and notify the listeners when the data is ready
/// This provider also supports pagination
class PlacesProvider extends ScreenDataProvider<List<PlaceModel>> {
  final _service = PlacesService();
  int _page = 0;

  bool _inPagination = false;
  bool _hasMoreInPagination = true;

  bool get inPagination => _inPagination;

  PlacesProvider({int pagesToLoad = 0}) {
    initializeData(pagesToLoad);
  }

  Future<void> initializeData(int pagesToLoad) async {
    data = [];
    for (int i = 0; i < pagesToLoad; i++) {
      await loadOtherPage();
    }
  }

  @override
  Future<List<PlaceModel>?> callService() async {
    final res = await _service.getPlaces(page: _page);
    _hasMoreInPagination = res?.hasMore ?? false;
    return res?.places;
  }

  Future<void> loadOtherPage() async {
    if (!_hasMoreInPagination) return;
    _inPagination = true;
    await getData(withPagination: true);
    _page++;
  }
}
