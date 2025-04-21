import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:math';

import 'package:tgs_info_app_flutter/presentation/views/flight_game/flight_game_view.dart';

const List<Map<String, String>> airportData = [
  {"city": "Hong Kong", "iata": "HKG"},
  {"city": "Tokyo Narita", "iata": "NRT"},
  {"city": "Bangkok Suvarnabhumi", "iata": "BKK"},
  {"city": "Münih", "iata": "MUC"},
  {"city": "Londra Gatwick", "iata": "LGW"},
  {"city": "Lyon", "iata": "LYS"},
  {"city": "Abu Dhabi", "iata": "AUH"},
  {"city": "Seul Incheon", "iata": "ICN"},
  {"city": "Delhi Indira Gandhi", "iata": "DEL"},
  {"city": "Osaka Kansai", "iata": "KIX"},
  {"city": "İstanbul", "iata": "IST"},
  {"city": "Roma Fiumicino", "iata": "FCO"},
  {"city": "Shanghai Pudong", "iata": "PVG"},
  {"city": "Dubai", "iata": "DXB"},
  {"city": "Paris CDG", "iata": "CDG"},
  {"city": "Taipei Taoyuan", "iata": "TPE"},
  {"city": "Berlin", "iata": "BER"},
  {"city": "Tokyo Haneda", "iata": "HND"},
  {"city": "Barselona", "iata": "BCN"},
  {"city": "Venedik", "iata": "VCE"},
  {"city": "Paris Orly", "iata": "ORY"},
  {"city": "Ho Chi Minh Tan Son Nhat", "iata": "SGN"},
  {"city": "Milan Malpensa", "iata": "MXP"},
  {"city": "Jakarta Soekarno–Hatta", "iata": "CGK"},
  {"city": "Frankfurt", "iata": "FRA"},
  {"city": "İzmir", "iata": "ADB"},
  {"city": "Singapore Changi", "iata": "SIN"},
  {"city": "Edinburgh", "iata": "EDI"},
  {"city": "Londra Heathrow", "iata": "LHR"},
  {"city": "Mumbai Chhatrapati Shivaji", "iata": "BOM"},
  {"city": "Nice", "iata": "NCE"},
  {"city": "Kuala Lumpur", "iata": "KUL"},
  {"city": "Doha Hamad", "iata": "DOH"},
  {"city": "Manchester", "iata": "MAN"},
  {"city": "Sabiha Gökçen", "iata": "SAW"},
  {"city": "Hanoi Noi Bai", "iata": "HAN"},
  {"city": "Madrid", "iata": "MAD"},
  {"city": "Ankara", "iata": "ESB"},
  {"city": "Manila NAIA", "iata": "MNL"},
];

class FlightGameViewModel extends ChangeNotifier {
  int score = 0;
  int questionCount = 0;
  final int maxQuestions = 10;
  Map<String, String>? currentQuestion;
  List<String> options = [];
  String? selectedAnswer;
  bool gameEnded = false;
  List<Map<String, String>> incorrectAnswers = [];
  List<String> recentlyUsedOptions = [];
  String? username;
  bool showCorrectAnswer = false;
  String? correctCity;

  void setUsername(String name) {
    username = name;
    generateQuestion();
    notifyListeners();
  }

  void generateQuestion() {
    if (questionCount >= maxQuestions) {
      gameEnded = true;
      saveScore();
      notifyListeners();
      return;
    }

    final random = Random();
    currentQuestion = airportData[random.nextInt(airportData.length)];
    options.clear();
    options.add(currentQuestion!['city']!);
    List<Map<String, String>> tempData = List.from(airportData)
      ..removeWhere((item) => item['city'] == currentQuestion!['city'] || recentlyUsedOptions.contains(item['city']));
    if (tempData.length < 3) {
      recentlyUsedOptions.clear();
      tempData = List.from(airportData)..removeWhere((item) => item['city'] == currentQuestion!['city']);
    }
    while (options.length < 4 && tempData.isNotEmpty) {
      final randomIndex = random.nextInt(tempData.length);
      final randomOption = tempData[randomIndex];
      options.add(randomOption['city']!);
      recentlyUsedOptions.add(randomOption['city']!);
      tempData.removeAt(randomIndex);
    }
    if (options.length < 4) {
      tempData = List.from(airportData)..removeWhere((item) => item['city'] == currentQuestion!['city']);
      while (options.length < 4 && tempData.isNotEmpty) {
        final randomIndex = random.nextInt(tempData.length);
        final randomOption = tempData[randomIndex];
        if (!options.contains(randomOption['city'])) {
          options.add(randomOption['city']!);
          recentlyUsedOptions.add(randomOption['city']!);
        }
        tempData.removeAt(randomIndex);
      }
    }
    while (options.length < 4) {
      final fallbackOption = airportData[random.nextInt(airportData.length)]['city']!;
      if (!options.contains(fallbackOption) && fallbackOption != currentQuestion!['city']) {
        options.add(fallbackOption);
        recentlyUsedOptions.add(fallbackOption);
      }
    }
    if (recentlyUsedOptions.length > 20) {
      recentlyUsedOptions.removeRange(0, recentlyUsedOptions.length - 20);
    }
    options.shuffle();
    selectedAnswer = null;
    showCorrectAnswer = false;
    correctCity = null;
    questionCount++;
    notifyListeners();
  }

  void checkAnswer(String answer) {
    selectedAnswer = answer;
    if (answer == currentQuestion!['city']) {
      score += 10;
    } else {
      showCorrectAnswer = true;
      correctCity = currentQuestion!['city'];
      incorrectAnswers.add({
        'iata': currentQuestion!['iata']!,
        'userAnswer': answer,
        'correctCity': currentQuestion!['city']!,
      });
      gameEnded = true;
      saveScore();
    }
    notifyListeners();
  }

  void nextQuestion() {
    generateQuestion();
  }

  void restartGame() {
    score = 0;
    questionCount = 0;
    gameEnded = false;
    incorrectAnswers.clear();
    recentlyUsedOptions.clear();
    showCorrectAnswer = false;
    correctCity = null;
    generateQuestion();
    notifyListeners();
  }
  void exitGame() {
    score = 0;
    questionCount = 0;
    gameEnded = false;
    incorrectAnswers.clear();
    recentlyUsedOptions.clear();
    showCorrectAnswer = false;
    correctCity = null;
    username = null;
    notifyListeners();
  }
  void saveScore() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> scores = prefs.getStringList('leaderboard') ?? [];
    final today = DateTime.now().toIso8601String().substring(0, 10);
    scores.add(jsonEncode({'username': username, 'score': score, 'date': today}));
    scores = scores
        .map((s) => jsonDecode(s) as Map<String, dynamic>)
        .where((s) => s['date'] == today)
        .map((s) => jsonEncode(s))
        .toList();
    await prefs.setStringList('leaderboard', scores);
  }

  void viewLeaderboard(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LeaderboardView()));
  }
  Future<List<Map<String, dynamic>>> getLeaderboard() async {
    final prefs = await SharedPreferences.getInstance();
    final scores = prefs.getStringList('leaderboard') ?? [];
    final today = DateTime.now().toIso8601String().substring(0, 10);
    return scores.map((s) => jsonDecode(s) as Map<String, dynamic>).where((s) => s['date'] == today).toList();
  }
}