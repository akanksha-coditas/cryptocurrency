import 'package:cryptocurrency/domain/entities/crypto_detail_entity.dart';
import 'package:cryptocurrency/domain/usecases/cryptocurrency_usecase.dart';
import 'package:flutter/material.dart';

class CryptoListingScreen extends StatefulWidget {
  const CryptoListingScreen({super.key});

  @override
  State<CryptoListingScreen> createState() => _CryptoListingScreenState();
}

class _CryptoListingScreenState extends State<CryptoListingScreen> {
  late Future<CryptoDetailEntity> cryptoDetailsFuture;

  @override
  void initState() {
    super.initState();
    cryptoDetailsFuture = CryptoCurrencyUsecase.getCryptoDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: FutureBuilder<CryptoDetailEntity>(
          future: cryptoDetailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final cryptoDetail = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildPriceChangeRow(
                      label: 'Current Price',
                      change: cryptoDetail.currentPrice),
                  buildPriceChangeRow(
                      label: 'Market Cap', change: cryptoDetail.marketCap),
                  buildPriceChangeRow(
                      label: 'Total Volume', change: cryptoDetail.totalVolume),
                  buildPriceChangeRow(
                      label: 'Price Change 24H',
                      change: cryptoDetail.priceChange24H),
                  buildPriceChangeRow(
                      label: 'Price Change Percentage 24H',
                      change: cryptoDetail.priceChangePercentage24H),
                ],
              );
            }
            return const Center(child: Text('No Data Available'));
          },
        ),
      ),
    );
  }

  Widget buildPriceChangeRow({required String label, required num? change}) {
    final bool isPositive = (change ?? 0) >= 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          Text(
            '${change?.toStringAsFixed(2)}%',
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
