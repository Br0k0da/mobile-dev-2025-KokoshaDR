import 'package:flutter/material.dart';

class WeatherDescription extends StatelessWidget {
  final String text;

  const WeatherDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}