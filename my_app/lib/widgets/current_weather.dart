import 'package:flutter/material.dart';
import 'weather_icon.dart';
import 'temperature.dart';
import 'weather_description.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          WeatherIcon(icon: Icons.wb_cloudy_outlined, size: 80),
          SizedBox(height: 8),
          Temperature(value: '+18°C'),
          SizedBox(height: 8),
          WeatherDescription(text: 'Облачно с прояснениями'),
        ],
      ),
    );
  }
}