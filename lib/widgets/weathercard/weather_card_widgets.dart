import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/weather_viewmodel.dart';
import 'package:tgs_info_app_flutter/presentation/views/Weather/weather_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class WeatherCardWidgets extends StatelessWidget {
  WeatherCardWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeatherViewModel>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherView()));
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.buttonColor, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      viewModel.getWeatherIcon(viewModel.weather!.currentWeatherCode),
                      size: 30,
                      color: AppColors.whiteSpot,
                    ),
                    SizedBox(width: 20),
                    Text(
                      viewModel.weather!.cityName,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '${viewModel.weather!.currentTemperature.toStringAsFixed(1)}°C',
                      style: const TextStyle(fontSize: 15, color: AppColors.whiteSpot, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Text(
                      viewModel.weather!.currentDescription,
                      style: const TextStyle(fontSize: 15, color: AppColors.whiteSpot, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
