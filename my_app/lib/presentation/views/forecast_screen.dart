import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/forecast_viewmodel.dart';
import '../viewmodels/city_selection_viewmodel.dart';
import '../widgets/forecast_list.dart';
import '../widgets/weather_app_bar.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  String? _lastLoadedCity;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadForecastIfNeeded();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadForecastIfNeeded();
  }

  void _loadForecastIfNeeded() {
    final cityVm = Provider.of<CitySelectionViewModel>(context, listen: false);
    final forecastVm = Provider.of<ForecastViewModel>(context, listen: false);

    final city = cityVm.selectedCity;
    if (city != null && city != _lastLoadedCity) {
      _lastLoadedCity = city;
      Future.microtask(() {
        forecastVm.load5DayForecast(city);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final forecastVm = Provider.of<ForecastViewModel>(context);
    final cityVm = Provider.of<CitySelectionViewModel>(context);

    final city = cityVm.selectedCity;

    return Scaffold(
      appBar: WeatherAppBar(title: 'Прогноз на 5 дней'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (city == null)
              const Text('Сначала выберите город на главном экране')
            else ...[
              const SizedBox(height: 16),
              Text('Прогноз для: $city', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              if (forecastVm.isLoading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (forecastVm.error != null)
                Expanded(
                  child: Center(
                    child: Text('Ошибка: ${forecastVm.error}'),
                  ),
                )
              else if (forecastVm.forecast != null)
                  Expanded(
                    child: ForecastList(forecast: forecastVm.forecast!),
                  )
                else
                  const Expanded(
                    child: Center(
                      child: Text('Нет данных прогноза'),
                    ),
                  ),
            ],
          ],
        ),
      ),
    );
  }
}