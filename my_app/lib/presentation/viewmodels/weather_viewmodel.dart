// lib/presentation/viewmodels/weather_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository_interface.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepositoryInterface repository;

  Weather? _weather;
  bool _isLoading = false;
  String? _error;
  String? _selectedCity;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedCity => _selectedCity;

  WeatherViewModel({required this.repository});

  Future<void> setCity(String city) async {
    _selectedCity = city;
    notifyListeners();
    await loadCurrentWeather(city);
  }

  Future<void> loadCurrentWeather(String city) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final w = await repository.getCurrentWeather(city);
      _weather = w;
    } catch (e) {
      _error = e.toString();
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}