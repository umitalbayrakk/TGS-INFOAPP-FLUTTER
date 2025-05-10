import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/core/themes/app_themes.dart';
import 'package:tgs_info_app_flutter/core/themes/theme_provider.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/weather_viewmodel.dart';
import 'package:tgs_info_app_flutter/presentation/views/oboardind/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initializeDateFormatting('tr_TR');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => WeatherViewModel()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            title: 'TGSInfoApp',
            home: OnboardingView(),
          );
        },
      ),
    );
  }
}
