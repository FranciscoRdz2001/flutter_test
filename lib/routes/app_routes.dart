import 'package:flutter/widgets.dart';
import 'package:flutter_test_work/modules/modules.dart';
import 'package:flutter_test_work/routes/routes_names.dart';

/// Class that contains the routes of the app
/// This class is used to navigate between pages
/// and to get the name of the routes
class AppRoutes {
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      RoutesNames.home: (context) => const HomeModule(),
      RoutesNames.placeDetail: (context) => const PlaceDetailsModule(id: -1),
    };
  }
}
