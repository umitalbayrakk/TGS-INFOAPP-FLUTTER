import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/borncard/born_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';
import 'package:tgs_info_app_flutter/widgets/foodcart/food_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/tgs_news/news_section_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/carousel_slider/coursel_slider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CourselSlider(),
            NewsSection(),
            BirthdayCard(),
            TurkishFoodCard(),
            //SizedBox(height: 20),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
