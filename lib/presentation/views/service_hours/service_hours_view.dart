import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:tgs_info_app_flutter/presentation/views/service_hours/service_hours_view_viewmodel.dart';
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          iconTheme: const IconThemeData(color: AppColors.borderColor, size: 35),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 10),
                child: Image.asset("assets/images/tgs.png", height: 150, width: 150),
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
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        new Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                          child: FlutterMap(
                            options: MapOptions(initialCenter: LatLng(41.1856, 28.7406), initialZoom: 13.0),
                            children: [
                              TileLayer(
                                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    width: 80.0,
                                    height: 80.0,
                                    point: LatLng(41.1856, 28.7406),
                                    child: Icon(Icons.location_pin, color: AppColors.cardColor, size: 40.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        new Container(
                          height: 80,
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage('assets/images/newmapss.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "${viewModel.selectedDistrict} Kalkış",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.serviceHoursForDistrict.length,
                            itemBuilder: (context, index) {
                              final item = viewModel.serviceHoursForDistrict[index];
                              return ListTile(
                                leading: Icon(Icons.directions_bus, color: Theme.of(context).iconTheme.color),
                                title: Text(
                                  ' ${item['location']}-${item['time']}   ',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Dünya Ticaret Merkezi Kalkış",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.serviceHoursList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Icon(Icons.directions_bus, color: Theme.of(context).iconTheme.color),
                                title: Text(
                                  "Kalkış DTM : ${viewModel.serviceHoursList[index]}",
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                                ),
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
