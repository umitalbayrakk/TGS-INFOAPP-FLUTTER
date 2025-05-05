import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/views/flight_game/flight_game_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class GameCard extends StatelessWidget {
  final Map<String, String> user;

  const GameCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          // border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: MaterialButton(
          onPressed: () {
            print('GameCard user: $user');
            Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(user: user)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.games_sharp, color: AppColors.whiteSpot, size: 30),
              SizedBox(width: 5),
              Text(
                "Oyun Oyna",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
