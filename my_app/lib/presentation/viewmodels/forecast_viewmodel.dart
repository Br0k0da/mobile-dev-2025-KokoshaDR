// lib/presentation/viewmodels/forecast_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../../domain/entities/forecast_day.dart';
import '../../domain/repositories/weather_repository_interface.dart';

class ForecastViewModel extends ChangeNotifier {
  final WeatherRepositoryInterface repository;

  List<ForecastDay>? _forecast;
  bool _isLoading = false;
  String? _error;

  List<ForecastDay>? get forecast => _forecast;
  bool get isLoading => _isLoading;
  String? get error => _error;

  ForecastViewModel({required this.repository});

  Future<void> load5DayForecast(String city) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final list = await repository.get5DayForecast(city);
      _forecast = list;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
