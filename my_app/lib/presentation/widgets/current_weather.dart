import 'package:flutter/material.dart';
import '../../domain/entities/weather.dart';
import 'weather_icon.dart';
import 'temperature.dart';
import 'weather_description.dart';

class CurrentWeather extends StatelessWidget {
  final Weather weather;

  const CurrentWeather({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconData = _mapIconToIconData(weather.icon);
    final iconColor = _mapIconToColor(weather.icon);

    return Center(
      child: Column(
        children: [
          WeatherIcon(icon: iconData, size: 80, color: iconColor),
          const SizedBox(height: 8),
          Temperature(value: '${weather.temperature.round()}°C'),
          const SizedBox(height: 8),
          WeatherDescription(text: weather.description),
        ],
      ),
    );
  }

  IconData _mapIconToIconData(String icon) {
    switch (icon) {
      case '01d':
      case '01n':
        return Icons.wb_sunny;
      case '02d':
      case '02n':
        return Icons.cloud;
      case '03d':
      case '03n':
        return Icons.cloud_queue;
      case '04d':
      case '04n':
        return Icons.cloud;
      case '09d':
      case '09n':
      case '10d':
      case '10n':
        return Icons.grain;
      case '11d':
      case '11n':
        return Icons.thunderstorm;
      case '13d':
      case '13n':
        return Icons.ac_unit;
      case '50d':
      case '50n':
        return Icons.blur_on;
      default:
        return Icons.wb_sunny;
    }
  }

  Color _mapIconToColor(String icon) {
    if (icon.startsWith('01')) return Colors.amber;
    if (icon.startsWith('02') || icon.startsWith('03') || icon.startsWith('04')) return Colors.blueGrey;
    if (icon.startsWith('09') || icon.startsWith('10')) return Colors.blue;
    if (icon.startsWith('11')) return Colors.deepPurple;
    if (icon.startsWith('13')) return Colors.lightBlueAccent;
    return Colors.grey;
  }
}