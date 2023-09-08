import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/utils/styles_util.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            'Cargando información...',
            style: StylesUtil.w400(12, Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
