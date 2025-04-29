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
          color: AppColors.customCardColor,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: MaterialButton(
          onPressed: () {
            // Tüm kritik noktalara print ekleyin:

print('GameCard user: $user'); // GameCard'da
            Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(user: user)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.games_sharp, color: AppColors.borderColor, size: 30),
              SizedBox(width: 5),
              Text(
                "Oyun Oyna",
                style: TextStyle(color: AppColors.borderColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
