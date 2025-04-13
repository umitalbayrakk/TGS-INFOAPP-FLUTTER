import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart'; // Türkçe yerel ayarlar için gerekli
import 'package:tgs_info_app_flutter/presentation/views/oboardind/onboarding_view.dart';

void main() async {
  // Cihazın sadece dikey olarak açılmasını sağlayan kod...
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Türkçe yerel ayarları başlat
  await initializeDateFormatting('tr_TR');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'TGS Info App',
      home: OnboardingView(),
    );
  }
}
