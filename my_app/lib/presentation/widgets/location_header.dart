import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/city_selection_viewmodel.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cityVm = Provider.of<CitySelectionViewModel>(context);
    final city = cityVm.selectedCity ?? 'Выберите город';

    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.blue[700], size: 20),
        const SizedBox(width: 8),
        Text(
          city,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}