import 'dart:async';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class TimeCard extends StatefulWidget {
  const TimeCard({super.key});

  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  String? _currentTime;
  String? _currentDate;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    initializeDateFormatting('tr_TR', null).then((_) {
      _updateTime();
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _updateTime();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime = DateFormat('HH:mm:ss', 'tr_TR').format(now);
      _currentDate = DateFormat('dd MMMM yyyy', 'tr_TR').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GestureDetector(
        onTap: () {
          _updateTime();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Card(
            color: AppColors.customCardColor.withOpacity(0.9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [AppColors.customCardColor.withOpacity(0.8), AppColors.customCardColor.withOpacity(0.6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, 4)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tarih Ve Saat",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.borderColor,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Icon(Bootstrap.clock_fill, size: 24, color: AppColors.borderColor.withOpacity(0.9)),
                      ],
                    ),
                    // _currentTime null ise yükleme mesajı göster...
                    _currentTime == null
                        ? Text(
                          "Yükleniyor...",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orangeColor.withOpacity(0.9),
                          ),
                        )
                        : Text(
                          _currentTime!,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.borderColor.withOpacity(0.9),
                          ),
                        ),
                    _currentDate == null
                        ? Text(
                          "Yükleniyor...",
                          style: TextStyle(fontSize: 15, color: AppColors.borderColor.withOpacity(0.85), height: 1.4),
                        )
                        : Text(
                          _currentDate!,
                          style: TextStyle(fontSize: 15, color: AppColors.borderColor.withOpacity(0.85), height: 1.4),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
