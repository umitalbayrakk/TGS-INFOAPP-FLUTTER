import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tgs_info_app_flutter/presentation/model/currency_model/currency_model.dart';

class CurrencyService {
  final String _baseUrl = 'https://api.frankfurter.app/latest?from=EUR&to=TRY,USD,GBP,AED,JPY,AUD,DKK,CHF,SEK,CAD,KWD,NOK,SAR,BGN,RON,RUB,CNY,PKR,QAR,ZAR,AZN';

  Future<List<CurrencyRate>> fetchRates() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final rates = data['rates'] as Map<String, dynamic>;
      final eurTryRate = rates['TRY'] as num;
      final currencyNames = {
        'USD': 'ABD DOLARI',
        'AUD': 'AVUSTRALYA DOLARI',
        'DKK': 'DANİMARKA KRONU',
        'GBP': 'İNGİLİZ STERLİNİ',
        'CHF': 'İSVİÇRE FRANGI',
        'SEK': 'İSVEÇ KRONU',
        'CAD': 'KANADA DOLARI',
        'KWD': 'KUVEYT DİNARI',
        'NOK': 'NORVEÇ KRONU',
        'SAR': 'SUUDİ ARABİSTAN RİYALİ',
        'JPY': 'JAPON YENİ',
        'BGN': 'BULGAR LEVASI',
        'RON': 'RUMEN LEYİ',
        'RUB': 'RUS RUBLESİ',
        'CNY': 'ÇİN YUANI',
        'PKR': 'PAKİSTAN RUPİSİ',
        'QAR': 'KATAR RİYALİ',
        'ZAR': 'GÜNEY KORE WONU', 
        'AZN': 'AZERBAYCAN YENİ MANATI',
        'AED': 'BİRLEŞİK ARAP EMİRLİKLERİ DİRHEMİ',
      };

      List<CurrencyRate> currencyRates = [];
      rates.forEach((currency, rate) {
        if (currency != 'TRY' && currencyNames.containsKey(currency)) {
          final tryRate = eurTryRate / rate;
          final buyingRate = tryRate * 0.995;
          final sellingRate = tryRate * 1.005;
          final unitFactor = currency == 'JPY' ? 100.0 : 1.0;
          currencyRates.add(CurrencyRate.fromMap(
            currency,
            currencyNames[currency]!,
            buyingRate / unitFactor,
            sellingRate / unitFactor,
          ));
        }
      });

      return currencyRates;
    } else {
      throw Exception('Döviz kurları alınamadı.');
    }
  }

  fetchUsdEurRates() {}
}