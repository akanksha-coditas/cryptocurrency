class CryptoDetailEntity {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final int? currentPrice;
  final int? marketCap;
  final int? marketCapRank;
  final int? totalVolume;
  final int? high24H;
  final int? low24H;
  final double? priceChange24H;
  final double? priceChangePercentage24H;
  final double? marketCapChange24H;
  final double? marketCapChangePercentage24H;
  final double? priceChangePercentage24HInCurrency;

  CryptoDetailEntity({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.priceChangePercentage24HInCurrency,
  });
}
