import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/utils/constant.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/borncard/born_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/day&date/day_and_day_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';
import 'package:tgs_info_app_flutter/widgets/foodcard/food_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/newsection/news_section_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/slider/coursel_slider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            CourselSlider(),
            SizedBox(height: 10),
            TimeCard(),
            NewsSection(),
            SizedBox(height: 10),
            BornTodayScreen(),
            foodText(),
            TurkishFoodCard(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
