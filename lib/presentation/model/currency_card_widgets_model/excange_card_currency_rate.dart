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