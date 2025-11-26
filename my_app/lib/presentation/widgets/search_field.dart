import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/city_selection_viewmodel.dart';
import '../viewmodels/weather_viewmodel.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final controller = TextEditingController();

  void _onSubmitted(String value) async {
    if (value.trim().isEmpty) return;

    final cityVm = Provider.of<CitySelectionViewModel>(context, listen: false);
    final weatherVm = Provider.of<WeatherViewModel>(context, listen: false);

    try {
      await cityVm.addCity(value.trim());
      await weatherVm.setCity(value.trim());

      controller.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onSubmitted: _onSubmitted,
        decoration: const InputDecoration(
          hintText: 'Поиск города...',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}