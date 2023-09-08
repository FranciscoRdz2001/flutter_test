import 'package:flutter/widgets.dart';
import 'package:flutter_test_work/domain/services/app_api.dart';

abstract class BaseService {
  @protected
  final api = AppApi.instance();
}
