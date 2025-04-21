import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/login_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = LoginViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.scaffoldBackgroundColor),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.customCardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderColor, width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Icon(FeatherIcons.logIn, color: AppColors.borderColor, size: 32),
                          SizedBox(width: 10),
                          Text(
                            "Giriş Yap",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.borderColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _viewModel.usernameController,
                      decoration: InputDecoration(
                        labelText: "Kullanıcı Adı",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(FeatherIcons.user),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _viewModel.passwordController,
                      decoration: InputDecoration(
                        labelText: "Şifre",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(FeatherIcons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: AppColors.customCardColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          await _viewModel.login(context);
                          if (_viewModel.errorMessage != null) {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    backgroundColor: AppColors.scaffoldBackgroundColor,
                                    title: Text(
                                      "Hata",
                                      style: TextStyle(color: AppColors.greenSpot, fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(_viewModel.errorMessage!),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Tamam", style: TextStyle(color: AppColors.borderColor)),
                                      ),
                                    ],
                                  ),
                            );
                          }
                        },
                        child: Text("Giriş Yap", style: TextStyle(color: AppColors.borderColor, fontSize: 25)),
                      ),
                    ),
                    SizedBox(height: 10),
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
