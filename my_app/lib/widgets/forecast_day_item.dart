import 'package:flutter/material.dart';
import '../models/forecast_data.dart';
import 'weather_icon.dart';
import 'weather_description.dart';

class ForecastDayItem extends StatelessWidget {
  final ForecastData forecastData;

  const ForecastDayItem({super.key, required this.forecastData});

  IconData _getIconData(String icon) {
    switch (icon) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.wb_cloudy;
      case 'rainy':
        return Icons.water_drop;
      case 'storm':
        return Icons.thunderstorm;
      default:
        return Icons.wb_sunny;
    }
  }

  Color _getIconColor(String icon) {
    switch (icon) {
      case 'sunny':
        return Colors.amber[700]!;
      case 'cloudy':
        return Colors.blue[400]!;
      case 'rainy':
        return Colors.blue[600]!;
      case 'storm':
        return Colors.purple[600]!;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
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
          WeatherIcon(
            icon: _getIconData(forecastData.icon),
            size: 40,
            color: _getIconColor(forecastData.icon),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  forecastData.day,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                WeatherDescription(text: forecastData.description),
              ],
            ),
          ),
          Text(
            '${forecastData.highTemp} / ${forecastData.lowTemp}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}