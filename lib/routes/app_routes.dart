import 'package:flutter/widgets.dart';
import 'package:flutter_test_work/modules/modules.dart';
import 'package:flutter_test_work/routes/routes_names.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      RoutesNames.home: (context) => const HomeModule(),
    };
  }
}
