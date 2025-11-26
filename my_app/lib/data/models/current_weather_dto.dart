class CurrentWeatherDto {
  final double temp;
  final int humidity;
  final double windSpeed;
  final List<WeatherItemDto> weather;

  CurrentWeatherDto({
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
  });

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherDto(
      temp: (json['main']['temp'] as num).toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      weather: (json['weather'] as List)
          .map((e) => WeatherItemDto.fromJson(e))
          .toList(),
    );
  }
}

class WeatherItemDto {
  final String description;
  final String icon;

  WeatherItemDto({required this.description, required this.icon});

  factory WeatherItemDto.fromJson(Map<String, dynamic> json) {
    return WeatherItemDto(
      description: json['description'],
      icon: json['icon'],
    );
  }
}
