import 'package:flutter/material.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const WeatherAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.wb_sunny, color: Colors.amber[700]),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
      backgroundColor: Colors.blue[50],
      elevation: 0,
    );
  }
}