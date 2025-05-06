import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tgs_info_app_flutter/presentation/views/Exchange_Rates/exchange_rates_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class ExcangecardWidgets extends StatefulWidget {
  const ExcangecardWidgets({super.key});

  @override
  State<ExcangecardWidgets> createState() => _ExcangecardWidgetsState();
}

class _ExcangecardWidgetsState extends State<ExcangecardWidgets> {
  final ExcangecardCurrencyService _currencyService = ExcangecardCurrencyService();
  List<ExcangecardCurrencyRate> _usdEuroRates = [];
  String? _errorMessage;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsdAndEuro();
  }

  Future<void> _loadUsdAndEuro() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _usdEuroRates = [];
    });

    try {
      debugPrint('USD ve EUR kurları çekiliyor...');
      final rates = await _currencyService.fetchUsdEurRates();
      debugPrint('Çekilen kurlar: $rates');
      if (rates.isNotEmpty) {
        setState(() {
          _usdEuroRates = rates;
        });
      } else {
        debugPrint('Çekilen veri boş!');
        setState(() {
          _usdEuroRates = [
            ExcangecardCurrencyRate(currencyCode: 'USD', currencyName: 'ABD Doları', buyingRate: 0.0, sellingRate: 0.0),
            ExcangecardCurrencyRate(currencyCode: 'EUR', currencyName: 'Euro', buyingRate: 0.0, sellingRate: 0.0),
          ];
        });
      }
    } catch (e) {
      debugPrint('Hata oluştu: $e');
      setState(() {
        _errorMessage = 'Döviz kurları alınamadı: ${e.toString()}';
        _usdEuroRates = [
          ExcangecardCurrencyRate(currencyCode: 'USD', currencyName: 'ABD Doları', buyingRate: 0.0, sellingRate: 0.0),
          ExcangecardCurrencyRate(currencyCode: 'EUR', currencyName: 'Euro', buyingRate: 0.0, sellingRate: 0.0),
        ];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Card(
        elevation: 3,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: _loadUsdAndEuro, child: const Text('Yeniden Dene')),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyScreen()));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(16),
            color: AppColors.cardColor3,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // DOLAR
                _buildCurrencyRow(
                  context,
                  currencyRate: _usdEuroRates.firstWhere(
                    (rate) => rate.currencyCode == 'USD',
                    orElse:
                        () => ExcangecardCurrencyRate(
                          currencyCode: 'USD',
                          currencyName: 'ABD Doları',
                          buyingRate: 0.0,
                          sellingRate: 0.0,
                        ),
                  ),
                  icon: Icons.attach_money,
                  iconColor: Colors.green,
                ),
                SizedBox(width: 20),
                // EURO
                _buildCurrencyRow(
                  context,
                  currencyRate: _usdEuroRates.firstWhere(
                    (rate) => rate.currencyCode == 'EUR',
                    orElse:
                        () => ExcangecardCurrencyRate(
                          currencyCode: 'EUR',
                          currencyName: 'Euro',
                          buyingRate: 0.0,
                          sellingRate: 0.0,
                        ),
                  ),
                  icon: Icons.euro,
                  iconColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Özel Currency Row Widgetı
  Widget _buildCurrencyRow(
    BuildContext context, {
    required ExcangecardCurrencyRate currencyRate,
    required IconData icon,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currencyRate.currencyName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.borderColor,
              ),
            ),
            Text(
              '1 ${currencyRate.currencyCode} = ${currencyRate.buyingRate.toStringAsFixed(2)} ',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, color: AppColors.borderColor),
            ),
          ],
        ),
      ],
    );
  }
}

// Models

class ExcangecardCurrencyRate {
  final String currencyCode;
  final String currencyName;
  final double buyingRate;
  final double sellingRate;

  ExcangecardCurrencyRate({
    required this.currencyCode,
    required this.currencyName,
    required this.buyingRate,
    required this.sellingRate,
  });

  factory ExcangecardCurrencyRate.fromMap(String code, String name, double buying, double selling) {
    return ExcangecardCurrencyRate(currencyCode: code, currencyName: name, buyingRate: buying, sellingRate: selling);
  }

  @override
  String toString() {
    return 'ExcangecardCurrencyRate(code: $currencyCode, name: $currencyName, buying: $buyingRate, selling: $sellingRate)';
  }
}

// Service
class ExcangecardCurrencyService {
  Future<List<ExcangecardCurrencyRate>> fetchUsdEurRates() async {
    final response = await http.get(Uri.parse('https://api.frankfurter.app/latest?from=EUR&to=TRY,USD'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final rates = data['rates'] as Map<String, dynamic>;

      final eurTryRate = rates['TRY'] as num;

      List<ExcangecardCurrencyRate> currencyRates = [];

      // EUR/TRY kurunu ekle
      currencyRates.add(ExcangecardCurrencyRate.fromMap('EUR', 'Euro', eurTryRate * 0.995, eurTryRate * 1.005));

      // USD/TRY kurunu ekle
      if (rates.containsKey('USD')) {
        final usdEurRate = rates['USD'] as num;
        final usdTryRate = eurTryRate / usdEurRate;
        currencyRates.add(ExcangecardCurrencyRate.fromMap('USD', 'ABD Doları', usdTryRate * 0.995, usdTryRate * 1.005));
      }

      return currencyRates;
    } else {
      throw Exception('USD ve EUR kurları alınamadı.');
    }
  }
}
