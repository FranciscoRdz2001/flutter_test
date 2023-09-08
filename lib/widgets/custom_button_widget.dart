import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final double size;
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Color(0xfff9f8f8),
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
