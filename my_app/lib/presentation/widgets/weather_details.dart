import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';
import 'weather_parameter.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherVm = Provider.of<WeatherViewModel>(context);
    final weather = weatherVm.weather;

    if (weather == null) {
      return Container();
    }

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherParameter(
            icon: Icons.opacity,
            value: '${weather.humidity}%',
            label: 'Влажность',
          ),
          WeatherParameter(
            icon: Icons.air,
            value: '${weather.windSpeed}м/с',
            label: 'Ветер',
          )
        ],
      ),
    );
  }
}