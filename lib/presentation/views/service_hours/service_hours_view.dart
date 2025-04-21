import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/service_hours_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';

class ServiceHoursView extends StatelessWidget {
  final Map<String, String> user;

  const ServiceHoursView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceHoursViewModel(user: user),
      child: Scaffold(
        drawer: CustomDrawer(user: user),
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.borderColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          iconTheme: const IconThemeData(color: AppColors.borderColor, size: 35),
          backgroundColor: AppColors.scaffoldBackgroundColor,
          elevation: 2,
          shadowColor: AppColors.borderColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 10),
                child: Image.asset("assets/tgs.png", height: 150, width: 150),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: Consumer<ServiceHoursViewModel>(
                  builder: (context, viewModel, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              viewModel.selectedDistrict,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                          child: Image.asset("assets/images/maps.png", height: 300, width: 400),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.serviceHoursForDistrict.length,
                            itemBuilder: (context, index) {
                              final item = viewModel.serviceHoursForDistrict[index];
                              return ListTile(
                                leading: const Icon(Bootstrap.alarm),
                                title: Text('Saat: ${item['time']}'),
                                subtitle: const Text('Konum: Dünya Ticaret Merkezi'),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
