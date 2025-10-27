import 'package:flutter/material.dart';
import '../models/forecast_data.dart';
import 'forecast_day_item.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    final forecastData = [
      const ForecastData(
        day: 'Понедельник',
        icon: 'cloudy',
        highTemp: '+20°C',
        lowTemp: '+12°C',
        description: 'Небольшая облачность',
      ),
      const ForecastData(
        day: 'Вторник',
        icon: 'rainy',
        highTemp: '+16°C',
        lowTemp: '+10°C',
        description: 'Небольшой дождь',
      ),
      const ForecastData(
        day: 'Среда',
        icon: 'sunny',
        highTemp: '+22°C',
        lowTemp: '+14°C',
        description: 'Солнечно',
      ),
      const ForecastData(
        day: 'Четверг',
        icon: 'cloudy',
        highTemp: '+19°C',
        lowTemp: '+13°C',
        description: 'Переменная облачность',
      ),
      const ForecastData(
        day: 'Пятница',
        icon: 'storm',
        highTemp: '+17°C',
        lowTemp: '+11°C',
        description: 'Гроза',
      ),
    ];

    return ListView.builder(
      itemCount: forecastData.length,
      itemBuilder: (context, index) {
        return ForecastDayItem(forecastData: forecastData[index]);
      },
    );
  }
}