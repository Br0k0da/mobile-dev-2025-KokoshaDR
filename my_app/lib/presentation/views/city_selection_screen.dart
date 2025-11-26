import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/city_selection_viewmodel.dart';

class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({Key? key}) : super(key: key);

  @override
  State<CitySelectionScreen> createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<CitySelectionViewModel>(context, listen: false)
          .loadCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CitySelectionViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Выберите город')),
      body: Column(
        children: [
          if (vm.isLoading) const CircularProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: vm.cities.length,
              itemBuilder: (c, i) {
                final city = vm.cities[i];
                return ListTile(
                  title: Text(city),
                  onTap: () => Navigator.of(context).pop(city),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => vm.removeCity(city),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(hintText: 'Добавить город'),
                    onSubmitted: (value) => vm.addCity(value.trim()),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
