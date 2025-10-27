import 'package:flutter/material.dart';
import '../widgets/weather_app_bar.dart';
import '../widgets/forecast_list.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherAppBar(title: 'Прогноз на 5 дней'),
      body: const ForecastList(),
    );
  }
}