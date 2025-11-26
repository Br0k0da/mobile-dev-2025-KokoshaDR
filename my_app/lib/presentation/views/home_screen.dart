import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';
import '../viewmodels/city_selection_viewmodel.dart';
import '../widgets/weather_app_bar.dart';
import '../widgets/current_weather.dart';
import '../widgets/location_header.dart';
import '../widgets/search_field.dart';
import '../widgets/weather_details.dart';
import 'city_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cityVm = Provider.of<CitySelectionViewModel>(context);
    final weatherVm = Provider.of<WeatherViewModel>(context);

    final selectedCity = cityVm.selectedCity;

    return Scaffold(
      appBar: WeatherAppBar(title: 'Погода'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocationHeader(),
            const SizedBox(height: 16),

            const SearchField(),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () async {
                final city = await Navigator.of(context).push<String>(
                  MaterialPageRoute(
                    builder: (_) => const CitySelectionScreen(),
                  ),
                );

                if (city != null) {
                  cityVm.selectCity(city);
                  await weatherVm.loadCurrentWeather(city);
                }
              },
              child: const Text('Выбрать из списка'),
            ),
            const SizedBox(height: 32),

            if (selectedCity != null) ...[
              if (weatherVm.isLoading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (weatherVm.error != null)
                Expanded(
                  child: Center(
                    child: Text('Ошибка: ${weatherVm.error}'),
                  ),
                )
              else if (weatherVm.weather != null) ...[
                  CurrentWeather(weather: weatherVm.weather!),
                  const SizedBox(height: 32),

                  const WeatherDetails(),
                ],
            ],

            const Spacer(),
          ],
        ),
      ),
    );
  }
}