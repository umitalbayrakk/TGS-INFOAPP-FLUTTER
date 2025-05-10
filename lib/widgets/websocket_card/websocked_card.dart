import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/model/btc_card_model/btc_card_model.dart';
import 'package:tgs_info_app_flutter/presentation/views/crypto/test_page.dart';
import 'package:tgs_info_app_flutter/services/btc_card_service/btc_card_service.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class BtcPriceCard extends StatefulWidget {
  const BtcPriceCard({super.key});

  @override
  State<BtcPriceCard> createState() => _BtcPriceCardState();
}

class _BtcPriceCardState extends State<BtcPriceCard> {
  final BtcWebSocketService _btcService = BtcWebSocketService();
  BtcData? _btcData;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _connectToWebSocket();
  }

  @override
  void dispose() {
    _btcService.disconnect();
    super.dispose();
  }

  void _connectToWebSocket() {
    _btcService.connect(
      onUpdate: (btcData) {
        if (mounted) {
          setState(() {
            _btcData = btcData;
            _isConnected = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CoinPricePage()));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            color: AppColors.cardColor3,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'BTC/USDT',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.borderColor),
                    ),
                    _buildConnectionStatus(),
                  ],
                ),
                const SizedBox(height: 10),
                _buildPriceInfo(),
                const SizedBox(height: 8),
                _buildChangePercentage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConnectionStatus() {
    return Row(
      children: [
        Icon(
          _isConnected ? Icons.circle : Icons.circle_outlined,
          color: _isConnected ? AppColors.snackBarGreen : Colors.grey,
          size: 12,
        ),
        const SizedBox(width: 4),
        Text(
          _isConnected ? 'Canlı' : 'Yükleniyor...',
          style: TextStyle(color: _isConnected ? AppColors.snackBarGreen : Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildPriceInfo() {
    return Row(
      children: [
        Text(
          _btcData != null ? '\$${_btcData!.lastPrice.toStringAsFixed(2)}' : '--',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.borderColor),
        ),
      ],
    );
  }

  Widget _buildChangePercentage() {
    final changePercent = _btcData?.priceChangePercent ?? 0;
    final isPositive = changePercent >= 0;

    return Row(
      children: [
        Icon(
          isPositive ? Icons.arrow_upward : Icons.arrow_downward,
          color: isPositive ? Colors.green : Colors.red,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          _btcData != null ? '${changePercent.toStringAsFixed(2)}%' : '--',
          style: TextStyle(color: isPositive ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Text(
          _btcData != null ? '24 Saatlik' : '',
          style: const TextStyle(color: AppColors.borderColor, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
