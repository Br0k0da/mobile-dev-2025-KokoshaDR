import 'package:flutter/material.dart';
import '../../data/local/city_storage.dart';

class CitySelectionViewModel extends ChangeNotifier {
  final CityStorage storage;

  CitySelectionViewModel({required this.storage});

  List<String> _cities = [];
  bool isLoading = false;
  String? selectedCity;

  List<String> get cities => _cities;

  Future<void> loadCities() async {
    isLoading = true;
    notifyListeners();

    _cities = await storage.loadCities();


    if (_cities.isEmpty) {
      _cities = [
        'Москва',
        'Санкт-Петербург',
        'Новосибирск',
        'Екатеринбург',
        'Казань',
        'Нижний Новгород',
        'Челябинск',
        'Самара',
        'Омск',
        'Ростов-на-Дону',
        'Уфа',
        'Красноярск',
        'Воронеж',
        'Пермь',
        'Волгоград',
        'Краснодар',
        'Саратов',
        'Тюмень',
        'Тольятти',
        'Ижевск'
      ];
      await storage.saveCities(_cities);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> addCity(String city) async {
    if (city.trim().isEmpty) return;
    if (!_cities.contains(city)) {
      _cities.add(city);
      await storage.saveCities(_cities);
    }
    selectedCity = city;
    notifyListeners();
  }

  Future<void> removeCity(String city) async {
    _cities.remove(city);
    if (selectedCity == city) selectedCity = null;
    await storage.saveCities(_cities);
    notifyListeners();
  }

  void selectCity(String city) {
    selectedCity = city;
    notifyListeners();
  }
}
