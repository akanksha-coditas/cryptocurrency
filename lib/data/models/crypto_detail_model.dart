import 'package:cryptocurrency/domain/entities/crypto_detail_entity.dart';

class CryptoDetailModel extends CryptoDetailEntity {
  CryptoDetailModel({
    required super.id,
    required super.symbol,
    required super.name,
    required super.image,
    required super.currentPrice,
    required super.marketCap,
    required super.marketCapRank,
    required super.totalVolume,
    required super.high24H,
    required super.low24H,
    required super.priceChange24H,
    required super.priceChangePercentage24H,
    required super.marketCapChange24H,
    required super.marketCapChangePercentage24H,
    required super.priceChangePercentage24HInCurrency,
  });
  factory CryptoDetailModel.fromJson(Map<String, dynamic> json) =>
      CryptoDetailModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"],
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        totalVolume: json["total_volume"],
        high24H: json["high_24h"],
        low24H: json["low_24h"],
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"]?.toDouble(),
        marketCapChange24H: json["market_cap_change_24h"]?.toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"]?.toDouble(),
        priceChangePercentage24HInCurrency:
            json["price_change_percentage_24h_in_currency"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "price_change_percentage_24h_in_currency":
            priceChangePercentage24HInCurrency,
      };
}
