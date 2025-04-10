import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/phone_numbers_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';

class PhoneNumbersViews extends StatelessWidget {
  const PhoneNumbersViews({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhoneNumbersViewModel(),
      child: Consumer<PhoneNumbersViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            drawer: const CustomDrawer(),
            backgroundColor: AppColors.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.scaffoldBackgroundColor,
              centerTitle: true,
              iconTheme: IconThemeData(color: AppColors.borderColor, size: 30),
              title: Image.asset("assets/tgs.png", height: 150, width: 150),
              actions: [
                Padding(padding: const EdgeInsets.only(right: 20, bottom: 5), child: _addButton(context, viewModel)),
              ],
              elevation: 2,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  PhoneSearchBar(controller: viewModel.searchController),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.filteredContacts.length,
                      itemBuilder: (context, index) {
                        final contact = viewModel.filteredContacts[index];
                        return ListTile(
                          minVerticalPadding: 0,
                          minLeadingWidth: 0,
                          dense: false,
                          contentPadding: const EdgeInsets.all(5), //
                          tileColor: AppColors.customCardColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.customCardColor,
                            child: Icon(FeatherIcons.user, color: AppColors.borderColor, size: 30),
                          ),
                          title: Text('${contact.name} ${contact.surname}'),
                          subtitle: Text('Doğum Tarihi: ${contact.birthDate}\nTelefon: ${contact.phone}'),
                          trailing: IconButton(
                            icon: const Icon(FeatherIcons.phoneCall, color: AppColors.snackBarGreen, size: 30),
                            onPressed: () => viewModel.makePhoneCall(contact.phone),
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

  FloatingActionButton _addButton(BuildContext context, PhoneNumbersViewModel viewModel) {
    return FloatingActionButton(
      onPressed: () => _showAddContactDialog(context, viewModel),
      backgroundColor: AppColors.borderColor,
      child: const Icon(Bootstrap.person_add, color: AppColors.scaffoldBackgroundColor),
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
          backgroundColor: AppColors.scaffoldBackgroundColor,
          title: Text('Yeni Kişi Ekle', style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.w500)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Bootstrap.person, color: AppColors.borderColor),
                    labelText: 'Adı',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Bootstrap.person, color: AppColors.borderColor),
                    labelText: 'Soyadı',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: birthDateController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Bootstrap.calendar2_check, color: AppColors.borderColor),
                    labelText: 'D.Tarihi (GG/AA/YYYY)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Bootstrap.phone, color: AppColors.borderColor),
                    labelText: 'Cep Telefonu',
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

class PhoneSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const PhoneSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.searcColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(FeatherIcons.search, color: AppColors.borderColor),
          suffixIcon: Icon(Bootstrap.filter_right, color: AppColors.borderColor),
          hintText: 'Telefon Ara...',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}
