import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/flight_time_viewmodel.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class FlightTimeView extends StatelessWidget {
  const FlightTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FlightTimeViewModel()..initialize(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBarWidgets(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<FlightTimeViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Uçuşlar',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Havalimanı Seçin'),
                              const SizedBox(height: 8),
                              DropdownButton<String>(
                                value: viewModel.selectedAirport,
                                isExpanded: true,
                                items:
                                    viewModel.airports
                                        .map(
                                          (airport) => DropdownMenuItem<String>(
                                            value: airport['kod'],
                                            child: Text(
                                              '${airport['kod']} - ${airport['adi']}',
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    viewModel.updateSelectedAirport(value);
                                  }
                                },
                                style: const TextStyle(color: Colors.black87),
                                dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                                icon: Icon(Icons.arrow_drop_down, color: Theme.of(context).iconTheme.color, size: 30),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Havayolu Şirketi Seçin'),
                              const SizedBox(height: 8),
                              DropdownButton<String>(
                                value: viewModel.selectedAirline,
                                isExpanded: true,
                                items:
                                    viewModel.airlines
                                        .map(
                                          (airline) => DropdownMenuItem<String>(
                                            value: airline['kod'],
                                            child: Text(
                                              '${airline['kod']} - ${airline['adi']}',
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    viewModel.updateSelectedAirline(value);
                                  }
                                },
                                style: const TextStyle(color: Colors.black87),
                                dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                                icon: Icon(Icons.arrow_drop_down, color: Theme.of(context).iconTheme.color, size: 30),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child:
                          viewModel.filteredFlights.isEmpty
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.flight_takeoff, color: Theme.of(context).iconTheme.color, size: 50),
                                    const SizedBox(height: 16),
                                    Text('Uçuş bulunamadı.', style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                              )
                              : ListView.builder(
                                itemCount: viewModel.filteredFlights.length,
                                itemBuilder: (context, index) {
                                  final flight = viewModel.filteredFlights[index];
                                  return ListTile(
                                    leading: Icon(flight['ikon'], color: Theme.of(context).iconTheme.color, size: 30),
                                    title: Text(
                                      '${flight['kalkis']} -> ${flight['varis']} (${flight['yon']})',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    subtitle: Text(
                                      'Saat: ${flight['saat']}\nTarih: ${flight['tarih']}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    trailing: Text(
                                      '${flight['havayolu']} - ${flight['kod']}',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  );
                                },
                              ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
