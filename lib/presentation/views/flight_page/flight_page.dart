import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/views/flight_page/flight_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class FlightPage extends StatelessWidget {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FlightViewModel()..fetchFlights(),
      child: Scaffold(
        body: Consumer<FlightViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewModel.errorMessage.isNotEmpty) {
              return Center(child: Text(viewModel.errorMessage));
            }
            if (viewModel.flights.isEmpty) {
              return const Center(child: Text('Uçuş verisi bulunamadı.'));
            }
            return ListView.builder(
              itemCount: viewModel.flights.length,
              itemBuilder: (context, index) {
                final flight = viewModel.flights[index];
                return Card(
                  color: AppColors.cardColor2,
                  child: ListTile(
                    title: Text(
                      'Çağrı İşareti: ${flight.callsign ?? 'Bilinmiyor'}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ülke: ${flight.country ?? 'Bilinmiyor'}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                        ),
                        Text(
                          'Enlem: ${flight.latitude ?? 'Bilinmiyor'}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                        ),
                        Text(
                          'Boylam: ${flight.longitude ?? 'Bilinmiyor'}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                        ),
                        Text(
                          'İrtifa: ${flight.altitude != null ? '${flight.altitude} m' : 'Bilinmiyor'}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
