import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

final List<Map<String, String>> airports = [
  {"city": "Adana", "airport": "Şakirpaşa Havalimanı", "iata": "ADA"},
  {"city": "Ankara", "airport": "Esenboğa Havalimanı", "iata": "ESB"},
  {"city": "Antalya", "airport": "Antalya Havalimanı", "iata": "AYT"},
  {"city": "Balıkesir", "airport": "Koca Seyit Havalimanı", "iata": "EDO"},
  {"city": "Batman", "airport": "Batman Havalimanı", "iata": "BAL"},
  {"city": "Bodrum", "airport": "Milas-Bodrum Havalimanı", "iata": "BJV"},
  {"city": "Bursa", "airport": "Yenişehir Havalimanı", "iata": "YEI"},
  {"city": "Denizli", "airport": "Çardak Havalimanı", "iata": "DNZ"},
  {"city": "Diyarbakır", "airport": "Diyarbakır Havalimanı", "iata": "DIY"},
  {"city": "Elazığ", "airport": "Elazığ Havalimanı", "iata": "EZS"},
  {"city": "Erzincan", "airport": "Erzincan Havalimanı", "iata": "ERC"},
  {"city": "Erzurum", "airport": "Erzurum Havalimanı", "iata": "ERZ"},
  {"city": "Eskişehir", "airport": "Hasan Polatkan Havalimanı", "iata": "AOE"},
  {"city": "Gaziantep", "airport": "Oğuzeli Havalimanı", "iata": "GZT"},
  {"city": "Hatay", "airport": "Hatay Havalimanı", "iata": "HTY"},
  {"city": "Isparta", "airport": "Süleyman Demirel Havalimanı", "iata": "ISE"},
  {"city": "İstanbul", "airport": "İstanbul (Yeni)", "iata": "IST"},
  {"city": "İstanbul", "airport": "Sabiha Gökçen Havalimanı", "iata": "SAW"},
  {"city": "İzmir", "airport": "Adnan Menderes Havalimanı", "iata": "ADB"},
  {"city": "Kahramanmaraş", "airport": "Kahramanmaraş Havalimanı", "iata": "KCM"},
  {"city": "Kars", "airport": "Harakani Havalimanı", "iata": "KSY"},
  {"city": "Kastamonu", "airport": "Kastamonu Havalimanı", "iata": "KFS"},
  {"city": "Kayseri", "airport": "Erkilet Havalimanı", "iata": "ASR"},
  {"city": "Kocaeli", "airport": "Cengiz Topel Havalimanı", "iata": "KCO"},
  {"city": "Konya", "airport": "Konya Havalimanı", "iata": "KYA"},
  {"city": "Malatya", "airport": "Erhaç Havalimanı", "iata": "MLX"},
  {"city": "Mardin", "airport": "Mardin Havalimanı", "iata": "MQM"},
  {"city": "Muğla", "airport": "Dalaman Havalimanı", "iata": "DLM"},
  {"city": "Muş", "airport": "Muş Havalimanı", "iata": "MSR"},
  {"city": "Nevşehir", "airport": "Kapadokya Havalimanı", "iata": "NAV"},
  {"city": "Ordu-Giresun", "airport": "Ordu-Giresun Havalimanı", "iata": "OGU"},
  {"city": "Rize", "airport": "Rize-Artvin Havalimanı", "iata": "RZV"},
  {"city": "Samsun", "airport": "Çarşamba Havalimanı", "iata": "SZF"},
  {"city": "Siirt", "airport": "Siirt Havalimanı", "iata": "SXZ"},
  {"city": "Sinop", "airport": "Sinop Havalimanı", "iata": "NOP"},
  {"city": "Şanlıurfa", "airport": "Şanlıurfa Havalimanı", "iata": "GNY"},
  {"city": "Tekirdağ", "airport": "Çorlu Havalimanı", "iata": "TEQ"},
  {"city": "Tokat", "airport": "Tokat Havalimanı", "iata": "TJK"},
  {"city": "Trabzon", "airport": "Trabzon Havalimanı", "iata": "TZX"},
  {"city": "Uşak", "airport": "Uşak Havalimanı", "iata": "USQ"},
  {"city": "Van", "airport": "Ferit Melen Havalimanı", "iata": "VAN"},
  {"city": "Zonguldak", "airport": "Zonguldak Havalimanı", "iata": "ONQ"},
  {"city": "Berlin", "airport": "Berlin Brandenburg Havalimanı", "iata": "BER"},
  {"city": "Düsseldorf", "airport": "Düsseldorf Havalimanı", "iata": "DUS"},
  {"city": "Frankfurt", "airport": "Frankfurt Havalimanı", "iata": "FRA"},
  {"city": "Hamburg", "airport": "Hamburg Havalimanı", "iata": "HAM"},
  {"city": "Hannover", "airport": "Hannover Havalimanı", "iata": "HAJ"},
  {"city": "Köln/Bonn", "airport": "Köln Bonn Havalimanı", "iata": "CGN"},
  {"city": "Münih", "airport": "Münih Havalimanı", "iata": "MUC"},
  {"city": "Nürnberg", "airport": "Nürnberg Havalimanı", "iata": "NUE"},
  {"city": "Stuttgart", "airport": "Stuttgart Havalimanı", "iata": "STR"},
  {"city": "Graz", "airport": "Graz Havalimanı", "iata": "GRZ"},
  {"city": "Innsbruck", "airport": "Innsbruck Havalimanı", "iata": "INN"},
  {"city": "Linz", "airport": "Linz Havalimanı", "iata": "LNZ"},
  {"city": "Salzburg", "airport": "Salzburg Havalimanı", "iata": "SZG"},
  {"city": "Viyana", "airport": "Viyana Havalimanı", "iata": "VIE"},
  {"city": "Bakü", "airport": "Haydar Aliyev Havalimanı", "iata": "GYD"},
  {"city": "Minsk", "airport": "Minsk Ulusal", "iata": "MSQ"},
  {"city": "Brüksel", "airport": "Brüksel Havalimanı", "iata": "BRU"},
  {"city": "Saraybosna", "airport": "Saraybosna Havalimanı", "iata": "SJJ"},
  {"city": "Sofya", "airport": "Sofya Havalimanı", "iata": "SOF"},
  {"city": "Prag", "airport": "Vaclav Havel Havalimanı", "iata": "PRG"},
  {"city": "Kopenhag", "airport": "Kastrup Havalimanı", "iata": "CPH"},
  {"city": "Tallinn", "airport": "Tallinn Havalimanı", "iata": "TLL"},
  {"city": "Helsinki", "airport": "Helsinki Havalimanı", "iata": "HEL"},
  {"city": "Bordeaux", "airport": "Bordeaux Havalimanı", "iata": "BOD"},
  {"city": "Lyon", "airport": "Lyon-Saint Exupéry Havalimanı", "iata": "LYS"},
  {"city": "Marsilya", "airport": "Marsilya Provence Havalimanı", "iata": "MRS"},
  {"city": "Nice", "airport": "Nice Côte d'Azur Havalimanı", "iata": "NCE"},
  {"city": "Paris", "airport": "Charles de Gaulle Havalimanı", "iata": "CDG"},
  {"city": "Paris", "airport": "Orly Havalimanı", "iata": "ORY"},
  {"city": "Toulouse", "airport": "Toulouse-Blagnac Havalimanı", "iata": "TLS"},
  {"city": "Batum", "airport": "Batum Havalimanı", "iata": "BUS"},
  {"city": "Tiflis", "airport": "Tiflis Havalimanı", "iata": "TBS"},
  {"city": "Dubrovnik", "airport": "Dubrovnik Havalimanı", "iata": "DBV"},
  {"city": "Zagreb", "airport": "Zagreb Havalimanı", "iata": "ZAG"},
  {"city": "Amsterdam", "airport": "Schiphol Havalimanı", "iata": "AMS"},
  {"city": "Eindhoven", "airport": "Eindhoven Havalimanı", "iata": "EIN"},
  {"city": "Rotterdam", "airport": "Rotterdam Havalimanı", "iata": "RTM"},
  {"city": "Birmingham", "airport": "Birmingham Havalimanı", "iata": "BHX"},
  {"city": "Edinburgh", "airport": "Edinburgh Havalimanı", "iata": "EDI"},
  {"city": "Londra", "airport": "Gatwick Havalimanı", "iata": "LGW"},
  {"city": "Londra", "airport": "Heathrow Havalimanı", "iata": "LHR"},
  {"city": "Manchester", "airport": "Manchester Havalimanı", "iata": "MAN"},
  {"city": "Dublin", "airport": "Dublin Havalimanı", "iata": "DUB"},
  {"city": "Barselona", "airport": "El Prat Havalimanı", "iata": "BCN"},
  {"city": "Madrid", "airport": "Barajas Havalimanı", "iata": "MAD"},
  {"city": "Malaga", "airport": "Malaga Havalimanı", "iata": "AGP"},
  {"city": "Valensiya", "airport": "Valensiya Havalimanı", "iata": "VLC"},
  {"city": "Göteborg", "airport": "Göteborg Landvetter Havalimanı", "iata": "GOT"},
  {"city": "Stockholm", "airport": "Arlanda Havalimanı", "iata": "ARN"},
  {"city": "Cenevre", "airport": "Cenevre Havalimanı", "iata": "GVA"},
  {"city": "Zürih", "airport": "Zürih Havalimanı", "iata": "ZRH"},
  {"city": "Bari", "airport": "Bari Havalimanı", "iata": "BRI"},
  {"city": "Bologna", "airport": "Bologna Havalimanı", "iata": "BLQ"},
  {"city": "Catania", "airport": "Catania Havalimanı", "iata": "CTA"},
  {"city": "Milano", "airport": "Malpensa Havalimanı", "iata": "MXP"},
  {"city": "Napoli", "airport": "Napoli Havalimanı", "iata": "NAP"},
  {"city": "Palermo", "airport": "Palermo Havalimanı", "iata": "PMO"},
  {"city": "Roma", "airport": "Fiumicino Havalimanı", "iata": "FCO"},
  {"city": "Venedik", "airport": "Marco Polo Havalimanı", "iata": "VCE"},
  {"city": "Reykjavik", "airport": "Keflavik Havalimanı", "iata": "KEF"},
  {"city": "Podgorica", "airport": "Podgorica Havalimanı", "iata": "TGD"},
  {"city": "Pristina", "airport": "Priştine Havalimanı", "iata": "PRN"},
  {"city": "Lefkoşa", "airport": "Ercan Havalimanı", "iata": "ECN"},
  {"city": "Riga", "airport": "Riga Havalimanı", "iata": "RIX"},
  {"city": "Vilnius", "airport": "Vilnius Havalimanı", "iata": "VNO"},
  {"city": "Lüksemburg", "airport": "Lüksemburg Havalimanı", "iata": "LUX"},
  {"city": "Budapeşte", "airport": "Budapeşte Havalimanı", "iata": "BUD"},
  {"city": "Malta", "airport": "Malta Havalimanı", "iata": "MLA"},
  {"city": "Oslo", "airport": "Oslo Gardermoen Havalimanı", "iata": "OSL"},
  {"city": "Krakow", "airport": "Krakow Havalimanı", "iata": "KRK"},
  {"city": "Varşova", "airport": "Chopin Havalimanı", "iata": "WAW"},
  {"city": "Lizbon", "airport": "Lizbon Havalimanı", "iata": "LIS"},
];

List<Map<String, String>> getShuffledAirports() {
  List<Map<String, String>> shuffledAirports = List.from(airports);
  shuffledAirports.shuffle();
  return shuffledAirports;
}

class GameScreen extends StatefulWidget {
  final Map<String, String>? user;
  const GameScreen({Key? key, this.user}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Map<String, String>> shuffledAirports = getShuffledAirports();
  int currentQuestionIndex = 0;
  int remainingLives = 1;
  int score = 0;
  List<String> options = [];
  String? selectedOption;
  String? errorMessage;
  bool showLeaderboard = false;
  bool showNextButton = false;
  List<Map<String, dynamic>> leaderboard = [];
  bool canPlay = true;

  @override
  void initState() {
    super.initState();
    _checkDailyLimit();
    _loadLeaderboard();
    if (canPlay) {
      _generateOptions();
    }
  }

  // Günlük oyun limitini kullanıcıya göre kontrol eden fonksiyon
  Future<void> _checkDailyLimit() async {
    final prefs = await SharedPreferences.getInstance();
    String userName =
        widget.user != null && widget.user!.containsKey("name") && widget.user!["name"] != null
            ? widget.user!["name"]!.trim()
            : "Bilinmeyen Kullanıcı";
    final String? lastPlayedDate = prefs.getString('${userName}_lastPlayedDate');
    final int gamesPlayed = prefs.getInt('${userName}_gamesPlayed') ?? 0;
    final currentDate = DateTime.now().toString().split(' ')[0];

    if (lastPlayedDate != currentDate) {
      // Yeni gün, sayacı sıfırla
      await prefs.setString('${userName}_lastPlayedDate', currentDate);
      await prefs.setInt('${userName}_gamesPlayed', 0);
      setState(() {
        canPlay = true;
      });
    } else if (gamesPlayed >= 3) {
      // Günlük limit aşılmış
      setState(() {
        canPlay = false;
      });
      _showLimitExceededDialog();
    }
  }

  // Günlük limit aşıldığında uyarı gösterir
  void _showLimitExceededDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColors.customCardColor,
            title: Text("Günlük Limit Aşıldı"),
            content: Text("Günde en fazla 3 kez oynayabilirsiniz. Yarın tekrar dene."),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("Ana Sayfa"))],
          ),
    );
  }

  // Oyun sayısını kullanıcıya göre artır
  Future<void> _incrementGameCount() async {
    final prefs = await SharedPreferences.getInstance();
    String userName =
        widget.user != null && widget.user!.containsKey("name") && widget.user!["name"] != null
            ? widget.user!["name"]!.trim()
            : "Bilinmeyen Kullanıcı";
    final int gamesPlayed = prefs.getInt('${userName}_gamesPlayed') ?? 0;
    await prefs.setInt('${userName}_gamesPlayed', gamesPlayed + 1);
  }

  // Lider tablosunu SharedPreferences'tan yükle.
  Future<void> _loadLeaderboard() async {
    final prefs = await SharedPreferences.getInstance();
    final String? leaderboardData = prefs.getString('leaderboard');
    if (leaderboardData != null) {
      setState(() {
        leaderboard = List<Map<String, dynamic>>.from(
          json.decode(leaderboardData).map((item) => Map<String, dynamic>.from(item)),
        );
      });
    }
  }

  // Lider tablosunu SharedPreferences'a kaydet
  Future<void> _saveLeaderboard() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('leaderboard', json.encode(leaderboard));
  }

  void _generateOptions() {
    options.clear();
    // Doğru cevabı ekle
    options.add(shuffledAirports[currentQuestionIndex]["city"]!);
    // Yanlış cevaplar için rastgele şehirler seç
    List<String> allCities = shuffledAirports.map((airport) => airport["city"]!).toList();
    allCities.remove(shuffledAirports[currentQuestionIndex]["city"]);
    allCities.shuffle();
    options.addAll(allCities.take(3));
    options.shuffle();
  }

  void _checkAnswer(String selected) {
    setState(() {
      selectedOption = selected;
      showNextButton = true;
      if (selected == shuffledAirports[currentQuestionIndex]["city"]) {
        score += 10;
        errorMessage = null;
      } else {
        remainingLives--;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (remainingLives == 0 || currentQuestionIndex == shuffledAirports.length - 1) {
        _endGame();
      } else {
        currentQuestionIndex++;
        _generateOptions();
        selectedOption = null;
        errorMessage = null;
        showNextButton = false;
      }
    });
  }

  void _endGame() async {
    // Oyun sayısını artır
    await _incrementGameCount();

    // Kullanıcının puanını lider tablosuna ekle
    String userName =
        widget.user != null && widget.user!.containsKey("name") && widget.user!["name"] != null
            ? widget.user!["name"]!.trim()
            : "Bilinmeyen Kullanıcı";

    // Kullanıcı zaten lider tablosunda var mı kontrol et
    bool userExists = false;

    for (var entry in leaderboard) {
      if (entry["name"]?.toString().trim() == userName) {
        // Puanları topla (eski puan + yeni puan)
        entry["score"] = (entry["score"] as int) + score;
        userExists = true;
        break;
      }
    }

    // Kullanıcı lider tablosunda yoksa ekle
    if (!userExists) {
      leaderboard.add({"name": userName, "score": score});
    }

    // Puanlara göre sırala (yüksek puan üste)
    leaderboard.sort((a, b) => (b["score"] as int).compareTo(a["score"] as int));

    // Lider tablosunu kaydet
    await _saveLeaderboard();

    setState(() {
      showLeaderboard = true;
    });
  }

  void _resetGame() async {
    final prefs = await SharedPreferences.getInstance();
    String userName =
        widget.user != null && widget.user!.containsKey("name") && widget.user!["name"] != null
            ? widget.user!["name"]!.trim()
            : "Bilinmeyen Kullanıcı";
    final int gamesPlayed = prefs.getInt('${userName}_gamesPlayed') ?? 0;
    if (gamesPlayed >= 3) {
      setState(() {
        canPlay = false;
      });
      _showLimitExceededDialog();
      return;
    }

    setState(() {
      shuffledAirports = getShuffledAirports();
      currentQuestionIndex = 0;
      remainingLives = 1;
      score = 0;
      options = [];
      selectedOption = null;
      errorMessage = null;
      showNextButton = false;
      showLeaderboard = false;
      _generateOptions();
    });
  }

  void _deleteUser(int index) async {
    setState(() {
      leaderboard.removeAt(index);
    });
    await _saveLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    String userName =
        widget.user != null && widget.user!.containsKey("name") && widget.user!["name"] != null
            ? widget.user!["name"]!.trim()
            : "Bilinmeyen Kullanıcı";

    if (!canPlay) {
      return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBarWidgets(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Günlük oyun limitiniz doldu!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.borderColor),
              ),
              SizedBox(height: 20),
              Text("Yarın tekrar oynayabilirsiniz.", style: TextStyle(fontSize: 18, color: AppColors.borderColor)),
              SizedBox(height: 20),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderColor, width: 3),
                ),
                child: MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Center(child: Text("Ana Sayfa", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (showLeaderboard) {
      return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          title: Row(
            children: [
              SizedBox(width: 10),
              Text("Lider Tablosu", style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: leaderboard.length,
                  itemBuilder: (context, index) {
                    bool isCurrentUser = leaderboard[index]["name"]?.toString().trim() == userName;
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.cardColor3,
                          //border: Border.all(color: AppColors.borderColor, width: 2),
                        ),
                        child: ListTile(
                          leading: Text("${index + 1}.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          title: Text(
                            leaderboard[index]["name"]?.toString() ?? "Bilinmeyen",
                            style: TextStyle(
                              fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.bold,
                              color: isCurrentUser ? AppColors.snackBarGreen : AppColors.borderColor,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Puan: ${leaderboard[index]["score"]?.toString() ?? "0"}",
                                style: TextStyle(
                                  fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.bold,
                                  fontSize: 20,
                                  color: isCurrentUser ? AppColors.snackBarGreen : AppColors.borderColor,
                                ),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                icon: Icon(Bootstrap.trash_fill, color: AppColors.cardColor, size: 30),
                                onPressed: () => _deleteUser(index),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: AppColors.cardColor2,
                        borderRadius: BorderRadius.circular(16),
                        //border: Border.all(color: AppColors.borderColor, width: 3),
                      ),
                      child: MaterialButton(
                        onPressed: _resetGame,
                        child: Center(
                          child: Text(
                            "Tekrar Oyna",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.cardColor2,
                        // border: Border.all(color: AppColors.borderColor, width: 3),
                      ),
                      child: MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        child: Center(
                          child: Text(
                            "Ana Sayfa",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 30, color: AppColors.borderColor),
                SizedBox(width: 5),
                Text(
                  "${widget.user!['name']}",
                  style: TextStyle(color: AppColors.borderColor, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Soru: ${currentQuestionIndex + 1}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    textAlign: TextAlign.center,
                    "Puan: $score",
                    style: TextStyle(fontSize: 20, color: AppColors.snackBarGreen, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
            Spacer(),
            Text(
              "${shuffledAirports[currentQuestionIndex]["iata"]} kodu hangi şehre aittir?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.borderColor),
              textAlign: TextAlign.center,
            ),
            if (errorMessage != null) ...[
              SizedBox(height: 10),
              Text(errorMessage!, style: TextStyle(color: Colors.red)),
            ],
            SizedBox(height: 20),
            ...options.map((option) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.cardColor3,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: MaterialButton(
                    onPressed: selectedOption == null ? () => _checkAnswer(option) : null,
                    child: Text(
                      option,
                      style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              );
            }).toList(),
            if (showNextButton) ...[
              SizedBox(height: 20),
              Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  color: AppColors.cardColor2,
                  borderRadius: BorderRadius.circular(15),
                  //border: Border.all(color: AppColors.borderColor, width: 3),
                ),
                child: MaterialButton(
                  onPressed: _nextQuestion,
                  child: Center(
                    child: Text(
                      "Sonraki Soru",
                      style: TextStyle(color: AppColors.whiteSpot, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
