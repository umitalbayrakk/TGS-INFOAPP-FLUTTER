import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Geri Bildirim Gönderildi!'),
          backgroundColor: AppColors.snackBarGreen,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        "Fikir Öneri İstek",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 32),
                      _buildInputField(_nameController, "Adınız", (val) => val!.isEmpty ? "Adınızı giriniz" : null),
                      const SizedBox(height: 16),
                      _buildInputField(
                        _surnameController,
                        "Soyadınız",
                        (val) => val!.isEmpty ? "Soyadınızı giriniz" : null,
                      ),
                      const SizedBox(height: 16),
                      _buildInputField(_emailController, "E-posta Adresiniz", (val) {
                        if (val!.isEmpty) return "E-posta giriniz";
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
                          return "Geçerli bir e-posta giriniz";
                        }
                        return null;
                      }, keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 16),
                      _buildInputField(
                        _feedbackController,
                        "Lütfen fikirlerinizi yazınız...",
                        (val) => val!.isEmpty ? "Geri bildirim giriniz" : null,
                        maxLines: 6,
                      ),
                      const SizedBox(height: 24),

                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: _submitFeedback,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FeatherIcons.send, color: AppColors.whiteSpot),
                              SizedBox(width: 5),
                              Text(
                                "Gönder",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.whiteSpot),
                              ),
                            ],
                          ),
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

  Widget _buildInputField(
    TextEditingController controller,
    String hintText,
    String? Function(String?)? validator, {
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.greenSpot, width: 1.8),
        ),
      ),
    );
  }
}
