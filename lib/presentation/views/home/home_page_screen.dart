import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/constant.dart';
import 'package:tgs_info_app_flutter/widgets/borncard/born_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';
import 'package:tgs_info_app_flutter/widgets/foodcart/food_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/gameCard/game_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/shiftcard/shift_card_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/shiftcard/shift_card_widgets_viewmodel.dart';
import 'package:tgs_info_app_flutter/widgets/tgs_news/news_section_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/carousel_slider/coursel_slider.dart';

class HomePageScreen extends StatefulWidget {
  final Map<String, String> user;

  const HomePageScreen({Key? key, required this.user}) : super(key: key);
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              CourselSlider(),
              SizedBox(height: 10),
              LastNewsText(),
              NewsSection(),
              SizedBox(height: 10),
              ShiftCardWidgets(viewModel: ShiftViewModel()),
              GameCard(user: widget.user),
              BirthdayCard(),
              TurkishFoodCard(),
            ],
          ),
        ),
      ),
    );
  }
}
