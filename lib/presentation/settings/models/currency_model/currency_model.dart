import 'dart:convert';

import 'exchange_rate.dart';

class CurrencyModel {
  final String? baseCurrency;
  final List<ExchangeRate>? exchangeRates;
  final String? baseCurrencyDate;

  const CurrencyModel({
    this.baseCurrency,
    this.exchangeRates,
    this.baseCurrencyDate,
  });

  @override
  String toString() {
    return 'CurrencyModel(baseCurrency: $baseCurrency, exchangeRates: $exchangeRates, baseCurrencyDate: $baseCurrencyDate)';
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> data) => CurrencyModel(
        baseCurrency: data['base_currency'] as String?,
        exchangeRates: (data['exchange_rates'] as List<dynamic>?)
            ?.map((e) => ExchangeRate.fromMap(e as Map<String, dynamic>))
            .toList(),
        baseCurrencyDate: data['base_currency_date'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'base_currency': baseCurrency,
        'exchange_rates': exchangeRates?.map((e) => e.toMap()).toList(),
        'base_currency_date': baseCurrencyDate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CurrencyModel].
  factory CurrencyModel.fromJson(String data) {
    return CurrencyModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CurrencyModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
