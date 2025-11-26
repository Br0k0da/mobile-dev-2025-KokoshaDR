import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final String value;

  const Temperature({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}