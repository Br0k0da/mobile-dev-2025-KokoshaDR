import 'package:flutter/material.dart';
import 'package:simple_weather_app/presentation/views/main_scaffold.dart';
import 'package:provider/provider.dart';
import 'config/config.dart';
import 'data/repository/weather_repository.dart';
import 'data/services/weather_api_service.dart';
import 'data/local/city_storage.dart';

import 'presentation/viewmodels/weather_viewmodel.dart';
import 'presentation/viewmodels/forecast_viewmodel.dart';
import 'presentation/viewmodels/city_selection_viewmodel.dart';


void main() {
  final apiService = WeatherApiService(apiKey: Config.apiKey);
  final weatherRepository = WeatherRepository(apiService: apiService);
  final cityStorage = CityStorage();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CitySelectionViewModel(storage: cityStorage)),
        ChangeNotifierProvider(
            create: (_) => WeatherViewModel(repository: weatherRepository)),
        ChangeNotifierProvider(
            create: (_) => ForecastViewModel(repository: weatherRepository)),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainScaffold(),
    );
  }
}
