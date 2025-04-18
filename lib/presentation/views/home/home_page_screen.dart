import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/shift_card_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/utils/constant.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/borncard/born_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';
import 'package:tgs_info_app_flutter/widgets/foodcart/food_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/shiftcard/shift_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/tgs_news/news_section_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/carousel_slider/coursel_slider.dart';

class HomePageScreen extends StatefulWidget {
  final Map<String, String> user;

  const HomePageScreen({super.key, required this.user});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    print("HomePageScreen'e gelen kullanıcı: ${widget.user['name']}, Konum: ${widget.user['location']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(user: widget.user),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Anasayfa İçeriği
              SizedBox(height: 20),
              //Slider
              CourselSlider(),
              SizedBox(height: 10),
              //Haberler& Duyuruklar
              LastNewsText(),
              NewsSection(),
              SizedBox(height: 5),
              ShiftCardWidgets(viewModel: ShiftViewModel()),
              BirthdayCard(),
              //Bu Gün doğanlar kartı
              //Yemek Kartı
              TurkishFoodCard(),
            ],
          ),
        ),
      ),
    );
  }
}
