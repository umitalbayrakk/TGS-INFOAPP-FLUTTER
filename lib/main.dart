import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tgs_info_app_flutter/presentation/views/oboardind/onboarding_view.dart';

void main() {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
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
