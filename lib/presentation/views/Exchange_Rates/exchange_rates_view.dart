import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class ExchangeRatesView extends StatefulWidget {
  const ExchangeRatesView({super.key});

  @override
  State<ExchangeRatesView> createState() => _ExchangeRatesViewState();
}

class _ExchangeRatesViewState extends State<ExchangeRatesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: Column(children: [

        ],
      ),
    );
  }
}
