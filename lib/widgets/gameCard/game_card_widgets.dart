import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/views/flight_game/flight_game_view.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FlightGameView(user: {})));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.games_sharp, color: AppColors.borderColor, size: 50),
              SizedBox(width: 5),
              Text(
                "Oyun Oyna",
                style: TextStyle(color: AppColors.borderColor, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
