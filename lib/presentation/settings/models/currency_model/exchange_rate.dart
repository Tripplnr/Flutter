import 'dart:convert';

class ExchangeRate {
  final String? exchangeRateBuy;
  final String? currency;

  const ExchangeRate({this.exchangeRateBuy, this.currency});

  @override
  String toString() {
    return 'ExchangeRate(exchangeRateBuy: $exchangeRateBuy, currency: $currency)';
  }

  factory ExchangeRate.fromMap(Map<String, dynamic> data) => ExchangeRate(
        exchangeRateBuy: data['exchange_rate_buy'] as String?,
        currency: data['currency'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'exchange_rate_buy': exchangeRateBuy,
        'currency': currency,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExchangeRate].
  factory ExchangeRate.fromJson(String data) {
    return ExchangeRate.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExchangeRate] to a JSON string.
  String toJson() => json.encode(toMap());
}
