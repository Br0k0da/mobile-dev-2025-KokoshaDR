import 'package:flutter/material.dart';
import '../../domain/entities/forecast_day.dart';
import 'weather_icon.dart';
import 'weather_description.dart';

class ForecastDayItem extends StatelessWidget {
  final ForecastDay forecastDay;

  const ForecastDayItem({Key? key, required this.forecastDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconData = _mapIconToIconData(forecastDay.icon);
    final iconColor = _mapIconToColor(forecastDay.icon);
    final dayName = _formatDate(forecastDay.date);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          WeatherIcon(icon: iconData, size: 40, color: iconColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dayName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                WeatherDescription(text: forecastDay.description),
              ],
            ),
          ),
          Text(
            '${forecastDay.maxTemp.round()}° / ${forecastDay.minTemp.round()}°',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}.${date.month}.${date.year}";
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