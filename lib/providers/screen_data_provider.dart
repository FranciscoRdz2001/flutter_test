import 'package:flutter/widgets.dart';

abstract class ScreenDataProvider<T> extends ChangeNotifier {
  T? _data;
  bool _isLoading = false;

  /// Loading getter and setter
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Data getter and setter
  T? get data => _data;
  set data(T? value) {
    _data = value;
    notifyListeners();
  }

  ScreenDataProvider() {
    _getData();
  }

  Future<T?> callService();
  Future<void> _getData() async {
    isLoading = true;
    data = await callService();
    isLoading = false;
  }
}
