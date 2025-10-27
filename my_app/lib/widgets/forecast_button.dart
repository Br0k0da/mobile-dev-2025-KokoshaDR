import 'package:flutter/material.dart';
import '../screens/forecast_screen.dart';

class ForecastButton extends StatelessWidget {
  const ForecastButton({super.key});

  void _onPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForecastScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _onPressed(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[600],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Прогноз на несколько дней',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}