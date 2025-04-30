import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
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
                            Icon(Icons.location_pin),
                            SizedBox(width: 5),
                            Text(
                              viewModel.selectedDistrict,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        new Container(
                          height: 200,
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.borderColor, width: 2),
                            image: new DecorationImage(
                              image: new AssetImage('assets/images/map.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        new Container(
                          height: 80,
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage('assets/images/mapsnew.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "${viewModel.selectedDistrict} Kalkış",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.serviceHoursForDistrict.length,
                            itemBuilder: (context, index) {
                              final item = viewModel.serviceHoursForDistrict[index];
                              return ListTile(
                                leading: const Icon(Icons.directions_bus),
                                title: Text(' ${item['location']}-${item['time']}  '),
                              );
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Dünya Ticaret Merkezi Kalkış",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.serviceHoursList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Icon(Icons.directions_bus),
                                title: Text("Kalkış DTM : ${viewModel.serviceHoursList[index]}"),
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
