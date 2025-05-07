import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tgs_info_app_flutter/presentation/model/currency_card_widgets_model/excange_card_currency_rate.dart';

class ExcangecardCurrencyService {
  Future<List<ExcangecardCurrencyRate>> fetchUsdEurRates() async {
    final response = await http.get(Uri.parse('https://api.frankfurter.app/latest?from=EUR&to=TRY,USD'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final rates = data['rates'] as Map<String, dynamic>;
      final eurTryRate = rates['TRY'] as num;
      List<ExcangecardCurrencyRate> currencyRates = [];
      currencyRates.add(ExcangecardCurrencyRate.fromMap('EUR', 'Euro', eurTryRate * 0.995, eurTryRate * 1.005));
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
