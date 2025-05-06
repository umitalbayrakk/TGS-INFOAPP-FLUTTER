import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/weather_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeatherViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBarWidgets(),
      body: Container(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hava Durumu',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down, color: AppColors.borderColor),
                  hint: Text(
                    'Şehir Seçin',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.borderColor),
                  ),
                  value: viewModel.selectedCity,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items:
                      viewModel.cities.keys.map((String city) {
                        return DropdownMenuItem<String>(value: city, child: Text(city));
                      }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      viewModel.fetchWeather(newValue);
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              if (viewModel.isLoading)
                const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))),
              if (viewModel.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (viewModel.weather != null) ...[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Theme.of(context).iconTheme.color!, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(
                          viewModel.getWeatherIcon(viewModel.weather!.currentWeatherCode),
                          size: 50,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewModel.weather!.cityName,
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${viewModel.weather!.currentTemperature.toStringAsFixed(1)}°C',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(viewModel.weather!.currentDescription, style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '7 Günlük Hava Durumu',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.weather!.dailyForecasts.length,
                    itemBuilder: (context, index) {
                      final forecast = viewModel.weather!.dailyForecasts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Theme.of(context).iconTheme.color!),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${viewModel.formatDay(forecast.date)}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  viewModel.getWeatherIcon(forecast.weatherCode),
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${forecast.maxTemp.toStringAsFixed(1)}° / ${forecast.minTemp.toStringAsFixed(1)}°',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    forecast.description,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
