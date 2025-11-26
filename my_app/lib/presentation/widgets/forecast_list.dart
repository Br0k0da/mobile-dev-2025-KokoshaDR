import 'package:flutter/material.dart';
import '../../domain/entities/forecast_day.dart';
import 'forecast_day_item.dart';

class ForecastList extends StatelessWidget {
  final List<ForecastDay> forecast;

  const ForecastList({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forecast.length,
      itemBuilder: (context, index) {
        return ForecastDayItem(forecastDay: forecast[index]);
      },
    );
  }
}
