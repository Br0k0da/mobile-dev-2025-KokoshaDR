import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/city_storage_interface.dart';


class CityStorage implements CityStorageInterface {
  static const _key = 'saved_cities';

  @override
  Future<List<String>> loadCities() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key);
    return list ?? [];
  }

  @override
  Future<void> saveCities(List<String> cities) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, cities);
  }
}
