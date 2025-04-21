import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/flight_game_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class FlightGameView extends StatefulWidget {
  const FlightGameView({super.key});

  @override
  State<FlightGameView> createState() => _FlightGameViewState();
}

class _FlightGameViewState extends State<FlightGameView> {
  final FlightGameViewModel viewModel = FlightGameViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUsernameDialog();
    });
  }

  void _showUsernameDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => UsernameDialog(
            onSubmit: (name) {
              viewModel.setUsername(name);
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        if (viewModel.username == null) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: AppBarWidgets(),
          body:
              viewModel.gameEnded
                  ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Oyun Bitti!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          Text(
                            "Puanınız: ${viewModel.score}",
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Yanlış Cevaplarınız:",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          if (viewModel.incorrectAnswers.isEmpty)
                            CurrentAnsverCard()
                          else
                            ...viewModel.incorrectAnswers.map((incorrect) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: AnsverCheckCard(incorrect),
                              );
                            }).toList(),
                          const SizedBox(height: 20),
                          _customBorderButton("Yeniden Başla", viewModel.restartGame),
                          const SizedBox(height: 10),
                          _customBorderButton("Lider Tablosu", () => viewModel.viewLeaderboard(context)),
                          const SizedBox(height: 10),
                          _customBorderButton("Çıkış", viewModel.exitGame),
                        ],
                      ),
                    ),
                  )
                  : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Soru ${viewModel.questionCount} / ${viewModel.maxQuestions}",
                              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Puan: ${viewModel.score}",
                              style: const TextStyle(
                                fontSize: 30,
                                color: AppColors.snackBarGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 150),
                        Text(
                          "${viewModel.currentQuestion!['iata']} kodu hangi şehre aittir?",
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ...viewModel.options.map((option) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: AnsverCard(
                              option: option,
                              isSelected: viewModel.selectedAnswer == option,
                              isCorrect: option == viewModel.currentQuestion!['city'],
                              showCorrectAnswer: viewModel.showCorrectAnswer,
                              onPressed: () => viewModel.checkAnswer(option),
                            ),
                          );
                        }).toList(),
                        if (viewModel.selectedAnswer != null && !viewModel.gameEnded) ...[
                          const SizedBox(height: 20),
                          if (viewModel.showCorrectAnswer)
                            Text(
                              "Yanlış! Doğru cevap: ${viewModel.correctCity}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.snackBarGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          const SizedBox(height: 10),
                          _customBorderButton("Sonraki Soru", viewModel.nextQuestion),
                        ],
                        const SizedBox(height: 20),
                        _customBorderButton("Çıkış", viewModel.exitGame),
                      ],
                    ),
                  ),
        );
      },
    );
  }

  Container CurrentAnsverCard() {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: AppColors.snackBarGreen, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Row(
        children: [
          const SizedBox(width: 10),
          const Icon(Icons.check, color: AppColors.whiteSpot),
          const SizedBox(width: 10),
          const Text(
            "Tebrikler tüm soruları doğru cevapladınız.",
            style: TextStyle(fontSize: 18, color: AppColors.whiteSpot),
          ),
        ],
      ),
    );
  }

  Container AnsverCheckCard(Map<String, String> incorrect) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.customCardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: ListTile(
        title: Text(
          "${incorrect['iata']} kodu hangi şehre aittir?",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sizin Cevabınız: ${incorrect['userAnswer']}", style: const TextStyle(color: AppColors.greenSpot)),
            Text(
              "Doğru Cevap: ${incorrect['correctCity']}",
              style: const TextStyle(color: AppColors.snackBarGreen, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget AnsverCard({
    required String option,
    required bool isSelected,
    required bool isCorrect,
    required bool showCorrectAnswer,
    required VoidCallback onPressed,
  }) {
    Color borderColor = AppColors.borderColor;
    Color? fillColor;
    if (showCorrectAnswer) {
      if (isCorrect) {
        fillColor = AppColors.snackBarGreen.withOpacity(0.2);
      } else if (isSelected) {
        fillColor = Colors.red.withOpacity(0.2);
      }
    }

    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: fillColor,
      ),
      child: MaterialButton(
        onPressed: viewModel.selectedAnswer == null ? onPressed : null,
        child: Text(
          option,
          style: const TextStyle(color: AppColors.borderColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Container _customBorderButton(String title, VoidCallback onPressed) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.borderColor),
          ),
        ),
      ),
    );
  }
}

class UsernameDialog extends StatelessWidget {
  final Function(String) onSubmit;
  UsernameDialog({required this.onSubmit});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Kullanıcı Adınızı Girin"),
      content: TextField(controller: _controller, decoration: const InputDecoration(hintText: "Adınızı yazın")),
      actions: [
        TextButton(
          onPressed: () {
            if (_controller.text.trim().isNotEmpty) {
              onSubmit(_controller.text.trim());
              Navigator.pop(context);
            }
          },
          child: const Text("Başla"),
        ),
      ],
    );
  }
}

class LeaderboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text("Günlük Lider Tablosu"), backgroundColor: AppColors.scaffoldBackgroundColor),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: FlightGameViewModel().getLeaderboard(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Henüz puan yok."));
          }

          final scores = snapshot.data!;
          scores.sort((a, b) => (b['score'] as int).compareTo(a['score'] as int));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: scores.length,
            itemBuilder: (context, index) {
              final score = scores[index];
              return Card(
                color: AppColors.customCardColor,
                child: ListTile(
                  leading: Text("${index + 1}.", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  title: Text(score['username'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Text(
                    "${score['score']} puan",
                    style: const TextStyle(fontSize: 16, color: AppColors.snackBarGreen),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
