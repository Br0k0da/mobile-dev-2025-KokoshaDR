import '../entities/forecast_day.dart';
import '../entities/weather.dart';

abstract class WeatherRepositoryInterface {
  Future<Weather> getCurrentWeather(String city);
  Future<List<ForecastDay>> get5DayForecast(String city);
}