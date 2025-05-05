import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/phone_numbers_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/custom_drawer/custom_drawer_view.dart';

class PhoneNumbersViews extends StatelessWidget {
  const PhoneNumbersViews({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhoneNumbersViewModel(),
      child: Consumer<PhoneNumbersViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            drawer: const CustomDrawer(user: {}),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              shadowColor: AppColors.borderColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Theme.of(context).appBarTheme.iconTheme!.color, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                  // AppBar title
                  _appBarTitle(),
                  // Phone number add button
                  _addButton(context, viewModel),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: PhoneSearchBar(controller: viewModel.searchController),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.filteredContacts.length,
                      itemBuilder: (context, index) {
                        final contact = viewModel.filteredContacts[index];
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundColor:
                                    Theme.of(context).brightness == Brightness.dark
                                        ? AppColors.whiteSpot
                                        : AppColors.borderColor,
                                child: Icon(FeatherIcons.user),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${contact.name} ${contact.surname}',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month, size: 15),
                                        SizedBox(width: 5),
                                        Text(contact.birthDate, style: const TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone, size: 15),
                                        SizedBox(width: 5),
                                        Text(contact.phone, style: const TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(FeatherIcons.phoneCall, color: AppColors.snackBarGreen),
                                onPressed: () => viewModel.makePhoneCall(contact.phone),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container _addButton(BuildContext context, PhoneNumbersViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.buttonColor),
      height: 50,
      width: 70,
      child: MaterialButton(
        onPressed: () => _showAddContactDialog(context, viewModel),
        child: const Icon(Icons.person_2, color: AppColors.whiteSpot, size: 30),
      ),
    );
  }

  void _showAddContactDialog(BuildContext context, PhoneNumbersViewModel viewModel) {
    final nameController = TextEditingController();
    final surnameController = TextEditingController();
    final birthDateController = TextEditingController();
    final phoneController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Yeni Kişi Ekle',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Bootstrap.person, color: Theme.of(context).iconTheme.color),
                    labelText: 'Adı',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Bootstrap.person, color: Theme.of(context).iconTheme.color),
                    labelText: 'Soyadı',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: birthDateController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Bootstrap.calendar2_check, color: Theme.of(context).iconTheme.color),
                    labelText: 'D.Tarihi (GG/AA/YYYY)',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Bootstrap.phone, color: Theme.of(context).iconTheme.color),
                    labelText: 'Cep Telefonu',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.greenSpot),
              onPressed: () => Navigator.pop(context),
              child: Text("İptal", style: TextStyle(color: AppColors.whiteSpot)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.snackBarGreen),
              onPressed: () {
                try {
                  viewModel.addNewContact(
                    nameController.text,
                    surnameController.text,
                    birthDateController.text,
                    phoneController.text,
                  );
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: const Text('Ekle', style: TextStyle(color: AppColors.whiteSpot)),
            ),
          ],
        );
      },
    );
  }
}

// ignore: camel_case_types
class _appBarTitle extends StatelessWidget {
  const _appBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Telefon", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold));
  }
}

class PhoneSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const PhoneSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.searcColor.withOpacity(0.08),
        prefixIcon: Icon(FeatherIcons.search, color: Theme.of(context).iconTheme.color),
        hintText: 'Telefon Ara...',
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.borderColor.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
      ),
    );
  }
}
