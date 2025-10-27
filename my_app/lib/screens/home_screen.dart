import 'package:flutter/material.dart';
import '../widgets/weather_app_bar.dart';
import '../widgets/search_field.dart';
import '../widgets/location_header.dart';
import '../widgets/current_weather.dart';
import '../widgets/weather_details.dart';
import '../widgets/forecast_button.dart';
import 'forecast_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openForecastScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForecastScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherAppBar(title: 'Погода'),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(),
            SizedBox(height: 32),
            LocationHeader(),
            SizedBox(height: 16),
            CurrentWeather(),
            SizedBox(height: 32),
            WeatherDetails(),
            Spacer(),
            ForecastButton(),
          ],
        ),
      ),
    );
  }
}