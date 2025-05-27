import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/views/login/login_page_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = LoginViewModel();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 400),
            scale: 1,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/login.png", width: 200, height: 200),
                        Text(
                          "Giriş Yap",
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                    TextField(
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      cursorColor: AppColors.borderColor,
                      controller: _viewModel.usernameController,
                      decoration: InputDecoration(
                        hintText: "E-Posta",
                        labelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: AppColors.textFiledColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        prefixIcon: Icon(FeatherIcons.user, color: AppColors.borderColor),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      cursorColor: AppColors.borderColor,
                      controller: _viewModel.passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: "Şifre",
                        labelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: AppColors.textFiledColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        prefixIcon: Icon(FeatherIcons.lock, color: AppColors.borderColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? FeatherIcons.eye : FeatherIcons.eyeOff,
                            color: AppColors.borderColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(color: AppColors.buttonColor, borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() => _isLoading = true);
                          await _viewModel.login(context);
                          setState(() => _isLoading = false);

                          if (_viewModel.errorMessage != null) {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                    title: Text(
                                      "Hata",
                                      style: TextStyle(color: AppColors.greenSpot, fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(_viewModel.errorMessage!),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          "Tamam",
                                          style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
                                        ),
                                      ),
                                    ],
                                  ),
                            );
                          }
                        },
                        child:
                            _isLoading
                                ? CircularProgressIndicator(color: AppColors.borderColor)
                                : Text("Giriş Yap", style: TextStyle(color: AppColors.whiteSpot, fontSize: 20)),
                      ),
                    ),

                    SizedBox(height: 16),
                    Text(
                      "TURKISH GROUNDS SERVICES",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
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
