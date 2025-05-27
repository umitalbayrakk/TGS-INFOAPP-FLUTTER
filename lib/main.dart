import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/core/themes/app_themes.dart';
import 'package:tgs_info_app_flutter/core/themes/theme_provider.dart';
import 'package:tgs_info_app_flutter/presentation/views/oboardind/onboarding_view.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  await initializeDateFormatting('tr_TR');
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /// Build the top-level widget with the [MaterialApp] and the
  /// [ThemeProvider] which handles the light and dark theme.
  ///
  /// The [MaterialApp] is the root widget of the application and it
  /// creates the [Material] widget tree.
  ///
  /// The [ThemeProvider] is a [ChangeNotifier] that is used to switch
  /// between light and dark theme.
  ///
  /// The [MaterialApp] is wrapped with a [MultiProvider] widget which
  /// is used to provide the [ThemeProvider] to the widget tree.
  ///
  /// The [Consumer] widget is used to listen to the [ThemeProvider] and
  /// builds the [MaterialApp] with the current theme.
  ///
  /// The [MaterialApp] is configured with the [AppThemes.lightTheme]
  /// and [AppThemes.darkTheme] which are the light and dark theme
  /// respectively.
  ///
  /// The [MaterialApp] is also configured to not show the debug banner.
  ///
  /// The [OnboardingView] is the home widget of the application which
  /// is used to show the onboarding screen.
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
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
