// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

class CurrencyModel {
  CurrencyModel({
    required this.cur,
    required this.buy,
    required this.type,
    required this.sell,
    required this.diff,
  });

  final String cur;
  final String buy;
  final String type;
  final String sell;
  final String diff;

}