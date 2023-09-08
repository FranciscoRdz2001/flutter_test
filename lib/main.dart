import 'package:flutter/material.dart';
import 'package:flutter_test_work/modules/home/presentation/pages/home_page.dart';
import 'package:flutter_test_work/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: AppRoutes.routes,
    );
  }
}
