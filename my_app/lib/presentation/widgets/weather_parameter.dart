import 'package:flutter/material.dart';
import 'package:simple_weather_app/presentation/widgets/weather_icon.dart';

class WeatherParameter extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const WeatherParameter({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherIcon(icon: icon, color: Colors.blue[600]),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}