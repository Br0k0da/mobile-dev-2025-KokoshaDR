import 'package:flutter/material.dart';
import '../models/forecast_data.dart';
import 'forecast_day_item.dart';

class ForecastList extends StatefulWidget {
  const ForecastList({super.key});

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
  final List<ForecastData> forecastData = [
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
  ];

  void _addItem() {
    setState(() {
      forecastData.add(
        const ForecastData(
          day: "Новый день",
          icon: "sunny",
          highTemp: "+23°C",
          lowTemp: "+15°C",
          description: "Хорошая погода",
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addItem,
          child: const Text("Добавить день"),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: forecastData.length,
            itemBuilder: (context, index) {
              return ForecastDayItem(forecastData: forecastData[index]);
            },
          ),
        ),
      ],
    );
  }
}
