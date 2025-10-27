import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;

  const WeatherIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color ?? Colors.blue[400],
      size: size,
    );
  }
}