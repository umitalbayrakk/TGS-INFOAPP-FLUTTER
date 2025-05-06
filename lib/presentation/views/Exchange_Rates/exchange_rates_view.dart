import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/model/currency_model/currency_model.dart';
import 'package:tgs_info_app_flutter/services/currency_services/currency_services.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  bool isLoading = true;
  List<CurrencyRate> rates = [];
  final CurrencyService _currencyService = CurrencyService();

  Future<void> fetchRates() async {
    setState(() => isLoading = true);
    try {
      rates = await _currencyService.fetchRates();
    } catch (e) {
      rates = [];
    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 10,
                    dataRowHeight: 60,
                    columns: [
                      DataColumn(
                        label: Text(
                          'Döviz Kodu',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                          width: 150,
                          child: Text(
                            'Döviz Cinsi',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Alış',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Satış',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows:
                        rates.map((rate) {
                          return DataRow(
                            cells: [
                              DataCell(Text(rate.currencyCode, style: const TextStyle(fontSize: 12))),
                              DataCell(
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    rate.currencyName,
                                    style: const TextStyle(fontSize: 12),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                              DataCell(Text(rate.buyingRate.toStringAsFixed(4), style: const TextStyle(fontSize: 12))),
                              DataCell(Text(rate.sellingRate.toStringAsFixed(4), style: const TextStyle(fontSize: 12))),
                            ],
                          );
                        }).toList(),
                  ),
                ),
              ),
      floatingActionButton: FloatingActionButton(onPressed: fetchRates, child: const Icon(Icons.refresh)),
    );
  }
}
