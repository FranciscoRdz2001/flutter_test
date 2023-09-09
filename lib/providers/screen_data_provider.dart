import 'package:flutter/widgets.dart';

enum ScreenState { loading, loaded, error, none }

/// Base class for screen data providers
/// This class is used to fetch data from the API
/// and notify the listeners when the data is ready
/// or when an error occurs
abstract class ScreenDataProvider<T> extends ChangeNotifier {
  T? _data;
  ScreenState _state = ScreenState.none;

  /// Loading getter and setter
  ScreenState get state => _state;
  set state(ScreenState value) {
    _state = value;
    notifyListeners();
  }

  /// Data getter and setter
  T? get data => _data;
  set data(T? value) {
    _data = value;
    notifyListeners();
  }

  Future<T?> callService();
  Future<void> getData({bool withPagination = false}) async {
    if (!withPagination) data = null;
    state = ScreenState.loading;
    final res = await callService();

    if (withPagination && data is List && res != null) {
      (_data as List).addAll(res as List);
      notifyListeners();
    } else if (!withPagination) {
      data = res;
    }
    state = data != null ? ScreenState.loaded : ScreenState.error;
  }
}
