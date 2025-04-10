import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:tgs_info_app_flutter/utils/constant.dart';

class BornTodayScreen extends StatefulWidget {
  const BornTodayScreen({super.key});

  @override
  State<BornTodayScreen> createState() => _BornTodayScreenState();
}

class _BornTodayScreenState extends State<BornTodayScreen> {
  final List<Map<String, String>> users = [
    {"name": "Ahmet Yılmaz", "birthDate": "5 Nisan 1985", "bio": "Uçak yer hizmetleri koordinatörü."},
    {"name": "Zeynep Demir", "birthDate": "23 Nisan 1990", "bio": "Bagaj handling uzmanı."},
    {"name": "Mehmet Kaya", "birthDate": "7 Temmuz 1978", "bio": "Yer operasyonları müdürü."},
    {"name": "Elif Çelik", "birthDate": "10 Ocak 1995", "bio": "Yolcu hizmetleri temsilcisi."},
    {"name": "Burak Şahin", "birthDate": "7 Nisan 1982", "bio": "Kargo yönetimi uzmanı."},
    {"name": "Merve Arslan", "birthDate": "30 Haziran 1988", "bio": "Apron güvenliği sorumlusu."},
    {"name": "Caner Özkan", "birthDate": "8 Nisan 1993", "bio": "Yakıt ikmal operatörü."},
    {"name": "Ebru Taş", "birthDate": "18 Kasım 1980", "bio": "Uçak bakım planlamacısı."},
    {"name": "Emre Karaca", "birthDate": "25 Eylül 1986", "bio": "Havalimanı lojistik koordinatörü."},
    {"name": "Selin Güneş", "birthDate": "8 Ağustos 1992", "bio": "Yolcu check-in operatörü."},
    {"name": "Ali Çetin", "birthDate": "15 Mart 1984", "bio": "Ramp hizmetleri mühendisi."},
    {"name": "Fatma Yılmazer", "birthDate": "20 Mayıs 1991", "bio": "Güvenlik denetçisi."},
    {"name": "Hakan Demirci", "birthDate": "3 Ekim 1979", "bio": "Operasyon planlama uzmanı."},
    {"name": "Ayşe Koca", "birthDate": "12 Aralık 1987", "bio": "Yer destek ekibi lideri."},
    {"name": "Mustafa Erdem", "birthDate": "9 Şubat 1994", "bio": "Uçak temizlik sorumlusu."},
  ];

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('d MMMM', 'tr_TR').format(DateTime.now()).toLowerCase();
    List<Map<String, String>> todayUsers = _filterUsersByToday(users, today);
    return Column(
      children: [
        bornText(),
        if (todayUsers.isNotEmpty)
          BornTodayCard(
            name: todayUsers[0]["name"]!,
            birthDate: todayUsers[0]["birthDate"]!,
            bio: todayUsers[0]["bio"]!,
          )
        else
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.customCardColor),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.person, color: AppColors.borderColor, size: 30),
                  SizedBox(width: 20),
                  Text('Bu gün doğan herhangi bir personel yok!'),
                ],
              ),
            ),
          ),
      ],
    );
  }

  List<Map<String, String>> _filterUsersByToday(List<Map<String, String>> users, String today) {
    return users.where((user) {
      String userDate = user["birthDate"]!.split(',')[0].trim();
      String userMonthDay = '${userDate.split(' ')[0]} ${userDate.split(' ')[1].toLowerCase()}';
      return userMonthDay == '${today.split(' ')[0].toLowerCase()} ${today.split(' ')[1]}';
    }).toList();
  }
}

class BornTodayCard extends StatelessWidget {
  final String name;
  final String birthDate;
  final String bio;
  const BornTodayCard({super.key, required this.name, required this.birthDate, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        color: AppColors.customCardColor.withOpacity(0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.borderColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(LineAwesome.birthday_cake_solid, color: AppColors.borderColor, size: 50),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.borderColor),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Doğum Tarihi: $birthDate",
                      style: TextStyle(fontSize: 14, color: AppColors.borderColor, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      bio,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, color: AppColors.borderColor.withOpacity(0.85)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
