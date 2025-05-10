import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tgs_info_app_flutter/presentation/model/wesocketmodel/websocket_model.dart';
import 'package:tgs_info_app_flutter/services/websocket/websocket_service.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class CoinPricePage extends StatefulWidget {
  const CoinPricePage({super.key});

  @override
  State<CoinPricePage> createState() => _CoinPricePageState();
}

class _CoinPricePageState extends State<CoinPricePage> {
  final WebSocketService _webSocketService = WebSocketService();
  final Map<String, Coin> _coinMap = {};
  final _formatter = NumberFormat('#,##0.00');

  @override
  void initState() {
    super.initState();
    _webSocketService.connect(
      onUpdate: (newCoin) {
        setState(() {
          final existing = _coinMap[newCoin.symbol];
          if (existing != null) {
            _coinMap[newCoin.symbol] = existing.copyWithNewPrice(newCoin.price);
          } else {
            _coinMap[newCoin.symbol] = newCoin;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _webSocketService.disconnect();
    super.dispose();
  }

  Color _getPriceColor(Coin coin) {
    if (coin.previousPrice == null) return Colors.black;
    if (coin.price > coin.previousPrice!) return Colors.green;
    if (coin.price < coin.previousPrice!) return Colors.red;
    return Colors.black;
  }

  Icon _getTrendIcon(Coin coin) {
    if (coin.previousPrice == null) return const Icon(Icons.remove, color: Colors.grey);
    if (coin.price > coin.previousPrice!) {
      return const Icon(Icons.arrow_upward, color: Colors.green);
    } else if (coin.price < coin.previousPrice!) {
      return const Icon(Icons.arrow_downward, color: Colors.red);
    } else {
      return const Icon(Icons.remove, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final coins = _coinMap.values.toList()..sort((a, b) => a.symbol.compareTo(b.symbol));

    return Scaffold(
      appBar: AppBarWidgets(),
      body: ListView.builder(
        itemCount: coins.length,
        itemBuilder: (context, index) {
          final coin = coins[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.cardColor3),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.borderColor,
                  child: Text(
                    coin.shortSymbol.substring(0, 2),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                  ),
                ),
                title: Text(coin.shortSymbol, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text("USDT paritesi"),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${_formatter.format(coin.price)}",
                      style: TextStyle(fontSize: 16, color: _getPriceColor(coin), fontWeight: FontWeight.bold),
                    ),
                    _getTrendIcon(coin),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
