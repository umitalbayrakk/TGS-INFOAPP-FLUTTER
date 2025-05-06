import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class ProfileView extends StatefulWidget {
  final Map<String, String> user;
  const ProfileView({super.key, required this.user});
  
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: Column(
        children: [
          Text(
            "Profil Detayları",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          CircleAvatar(
            radius: 80,
            backgroundColor: Theme.of(context).iconTheme.color,
            child: Icon(Icons.person, size: 80),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                ProfileCard(Icons.person, "${widget.user["name"]}"),
                SizedBox(height: 20),
                ProfileCard(Icons.email, "${widget.user["email"]}"),
                SizedBox(height: 20),
                ProfileCard(Icons.location_city_outlined, "${widget.user["bio"]}"),
                SizedBox(height: 20),
                ProfileCard(Icons.calendar_month, "${widget.user["birthDate"]}"),
                SizedBox(height: 20),
                ProfileCard(Icons.location_city_outlined, "${widget.user["location"]}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container ProfileCard(icon, title) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardColor3,
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(icon, color: AppColors.borderColor),
          SizedBox(width: 20),
          Center(
            child: Text(
              title,
              style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}