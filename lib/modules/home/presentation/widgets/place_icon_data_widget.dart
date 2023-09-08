import 'package:flutter/material.dart';
import 'package:flutter_test_work/core/utils/styles_util.dart';

class PlaceIconDataWidget extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? fontColor;
  final String data;
  final double size;
  const PlaceIconDataWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.data,
    this.size = 10,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: size),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            data,
            style: StylesUtil.w400(size, fontColor ?? Colors.grey[500]),
          ),
        ),
      ],
    );
  }
}
