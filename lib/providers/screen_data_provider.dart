import 'package:flutter/widgets.dart';

enum ScreenState { loading, loaded, error, none }

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

  ScreenDataProvider() {
    getData();
  }

  Future<T?> callService();
  Future<void> getData() async {
    data = null;
    state = ScreenState.loading;
    data = await callService();
    state = data != null ? ScreenState.loaded : ScreenState.error;
  }
}
