import 'package:intl/intl.dart';
import '../../domain/entities/forecast_day.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository_interface.dart';
import '../services/weather_api_service.dart';
import '../models/forecast_dto.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  final WeatherApiService apiService;

  WeatherRepository({required this.apiService});

  @override
  Future<Weather> getCurrentWeather(String city) async {
    final forecastDto = await apiService.fetch5DayForecast(city);
    final first = forecastDto.items.first;
    final weatherItem = first.weather.first;
    return Weather(
      temperature: first.temp,
      description: weatherItem.description,
      icon: weatherItem.icon,
      humidity: first.humidity,
      windSpeed: first.windSpeed,
    );
  }

  @override
  Future<List<ForecastDay>> get5DayForecast(String city) async {
    final forecastDto = await apiService.fetch5DayForecast(city);
    final items = forecastDto.items;

    Map<String, List<ForecastListItem>> byDate = {};

    for (var item in items) {
      final dateStr = item.dtTxt.split(' ').first;
      byDate.putIfAbsent(dateStr, () => []);
      byDate[dateStr]!.add(item);
    }

    List<ForecastDay> result = [];

    byDate.forEach((dateStr, dailyItems) {
      double minT = dailyItems.first.tempMin;
      double maxT = dailyItems.first.tempMax;
      Map<String, int> iconCount = {};
      Map<String, int> descCount = {};

      for (var it in dailyItems) {
        if (it.tempMin < minT) minT = it.tempMin;
        if (it.tempMax > maxT) maxT = it.tempMax;

        final icon = it.weather.first.icon;
        iconCount[icon] = (iconCount[icon] ?? 0) + 1;

        final desc = it.weather.first.description;
        descCount[desc] = (descCount[desc] ?? 0) + 1;
      }

      String mostIcon = iconCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      String mostDesc = descCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;

      final date = DateFormat('yyyy-MM-dd').parse(dateStr);

      result.add(ForecastDay(
        date: date,
        minTemp: minT,
        maxTemp: maxT,
        description: mostDesc,
        icon: mostIcon,
      ));
    });

    result.sort((a, b) => a.date.compareTo(b.date));

    return result.take(5).toList();
  }
}
