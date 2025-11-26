class ForecastDto {
  final String cityName;
  final List<ForecastListItem> items;

  ForecastDto({required this.cityName, required this.items});

  factory ForecastDto.fromJson(Map<String, dynamic> json) {
    final city = json['city'];
    final list = (json['list'] as List).map((e) => ForecastListItem.fromJson(e)).toList();
    return ForecastDto(cityName: city['name'], items: list);
  }
}

class ForecastListItem {
  final int dt; // timestamp
  final double temp;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final List<WeatherItem> weather;
  final double windSpeed;
  final String dtTxt;

  ForecastListItem({
    required this.dt,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.windSpeed,
    required this.dtTxt,
  });

  factory ForecastListItem.fromJson(Map<String, dynamic> json) {
    return ForecastListItem(
      dt: json['dt'],
      temp: (json['main']['temp'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      weather: (json['weather'] as List).map((w) => WeatherItem.fromJson(w)).toList(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      dtTxt: json['dt_txt'],
    );
  }
}

class WeatherItem {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherItem({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    return WeatherItem(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
