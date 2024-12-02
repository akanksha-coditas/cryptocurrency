import 'dart:convert';

import 'package:cryptocurrency/core/network_constants.dart';
import 'package:cryptocurrency/data/models/crypto_detail_model.dart';
import 'package:cryptocurrency/domain/entities/crypto_detail_entity.dart';
import 'package:http/http.dart' as http;

class CryptoCurrencyUsecase {
  static Future<CryptoDetailEntity> getCryptoDetails() async {
    const String apiUrl = NetworkConstants.cryptoDetail;
    const Map<String, String> queryParams = {
      'vs_currency': 'usd',
      'ids': 'bitcoin',
      'price_change_percentage': '24h,7d,30d',
    };

    final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        return CryptoDetailModel.fromJson(data.first);
      } else {
        throw Exception(
            'Invalid cryptocurrency or No data found for the specified cryptocurrency.');
      }
    } else {
      throw Exception(
          'Failed to fetch data from API. Status code: ${response.statusCode}');
    }
  }
}
