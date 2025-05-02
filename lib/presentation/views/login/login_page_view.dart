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
      body: Container(
        decoration: BoxDecoration(color: AppColors.scaffoldBackgroundColor),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 400),
              scale: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.customCardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderColor, width: 1.5),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: Offset(0, 10))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: 1.0,
                        child: Column(
                          children: [
                            Icon(FeatherIcons.logIn, color: AppColors.borderColor, size: 36),
                            SizedBox(height: 12),
                            Text(
                              "Giriş Yap",
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.borderColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        controller: _viewModel.usernameController,
                        decoration: InputDecoration(
                          labelText: "E-Posta",
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.04),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.greenSpot, width: 2),
                          ),
                          prefixIcon: Icon(FeatherIcons.user),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _viewModel.passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: "Şifre",
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.04),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.greenSpot, width: 2),
                          ),
                          prefixIcon: Icon(FeatherIcons.lock),
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
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.customCardColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.borderColor),
                        ),
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
                          child:
                              _isLoading
                                  ? CircularProgressIndicator(color: AppColors.borderColor)
                                  : Text("Giriş Yap", style: TextStyle(color: AppColors.borderColor, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
