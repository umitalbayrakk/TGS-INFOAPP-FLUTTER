import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/model/currency_card_widgets_model/excange_card_currency_rate.dart';
import 'package:tgs_info_app_flutter/presentation/views/Exchange_Rates/exchange_rates_view.dart';
import 'package:tgs_info_app_flutter/services/excange_card_services/excange_card_currency_service.dart';
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
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyScreen()));
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.buttonColor),
          child:
              _isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.whiteSpot, strokeWidth: 2))
                  : _errorMessage != null
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        ElevatedButton(
                          onPressed: _loadUsdAndEuro,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.buttonColor,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                          child: const Text('Yeniden Dene'),
                        ),
                      ],
                    ),
                  )
                  : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCurrencyRow(
                          context,
                          currencyRate: _usdEuroRates.firstWhere(
                            (rate) => rate.currencyCode == 'USD',
                            orElse:
                                () => ExcangecardCurrencyRate(
                                  currencyCode: 'USD',
                                  currencyName: 'Dolar',
                                  buyingRate: 0.0,
                                  sellingRate: 0.0,
                                ),
                          ),
                          icon: Icons.attach_money,
                          iconColor: Colors.white,
                        ),
                        const SizedBox(width: 20),
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
                          iconColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _buildCurrencyRow(
    BuildContext context, {
    required ExcangecardCurrencyRate currencyRate,
    required IconData icon,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1${currencyRate.currencyCode} = ${currencyRate.buyingRate.toStringAsFixed(2)}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
            ),
          ],
        ),
      ],
    );
  }
}
