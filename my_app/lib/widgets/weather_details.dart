import 'package:flutter/material.dart';
import 'weather_parameter.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherParameter(
            icon: Icons.opacity,
            value: '65%',
            label: 'Влажность',
          ),
          WeatherParameter(
            icon: Icons.air,
            value: '3м/с',
            label: 'Ветер',
          ),
          WeatherParameter(
            icon: Icons.compress,
            value: '1015',
            label: 'Давление',
          ),
        ],
      ),
    );
  }
}