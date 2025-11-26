import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/forecast_dto.dart';

class WeatherApiService {
  final String apiKey;
  final http.Client httpClient;

  WeatherApiService({
    required this.apiKey,
    http.Client? client,
  }) : httpClient = client ?? http.Client();

  Future<ForecastDto> fetch5DayForecast(String city) async {
    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/forecast',
      {
        'q': city,
        'appid': apiKey,
        'units': 'metric',
        'lang': 'ru',
      },
    );
    final response = await httpClient.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Error fetching forecast: ${response.statusCode}');
    }
    final jsonBody = json.decode(response.body) as Map<String, dynamic>;
    return ForecastDto.fromJson(jsonBody);
  }

}
