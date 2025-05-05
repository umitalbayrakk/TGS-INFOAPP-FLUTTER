import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';


class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(),
      body: Column(
        children: [

        ],
      ),
    );
  }
}