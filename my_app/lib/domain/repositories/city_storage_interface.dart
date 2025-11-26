abstract class CityStorageInterface {
  Future<List<String>> loadCities();
  Future<void> saveCities(List<String> cities);
}
