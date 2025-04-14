import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class BirthdayCard extends StatelessWidget {
  final List<User> users = [
    User("Ahmet", "Yılmaz", DateTime(1990, 4, 14)), // 11 Nisan 1990 (Çarşamba)
    User("Mehmet", "Kara", DateTime(1985, 4, 11)), // 11 Nisan 1985 (Çarşamba)
    User("Ayşe", "Demir", DateTime(1993, 4, 12)), // 12 Nisan 1993 (Perşembe)
    User("Fatma", "Çelik", DateTime(1991, 4, 13)), // 13 Nisan 1991 (Cuma)
    User("Ayşe", "Çalık", DateTime(1991, 4, 13)), // 13 Nisan 1991 (Cuma)
    User("Ali", "Şahin", DateTime(1987, 4, 17)), // 17 Nisan 1987 (Pazartesi, kaydırıldı)
    User("Burak", "Kaya", DateTime(1990, 4, 18)), // 18 Nisan 1990
    User("Ceren", "Erdem", DateTime(1990, 4, 14)), // 25 Nisan 1990
    User("Deniz", "Gök", DateTime(1990, 5, 2)), // 2 Mayıs 1990
    User("Ece", "Aydin", DateTime(1990, 5, 9)), // 9 Mayıs 1990
    User("Furkan", "Özden", DateTime(1990, 5, 16)), // 16 Mayıs 1990
    User("Gizem", "Yıldız", DateTime(1990, 5, 23)), // 23 Mayıs 1990
    User("Hakan", "Balkan", DateTime(1990, 5, 30)), // 30 Mayıs 1990
    User("İrem", "Sönmez", DateTime(1990, 6, 6)), // 6 Haziran 1990
    User("Jale", "Turan", DateTime(1990, 6, 13)), // 13 Haziran 1990
    User("Efe", "Kaya", DateTime(1985, 4, 18)), // 18 Nisan 1985
    User("Selin", "Erdem", DateTime(1985, 4, 25)), // 25 Nisan 1985
    User("Yusuf", "Gök", DateTime(1985, 5, 2)), // 2 Mayıs 1985
    User("Zeynep", "Aydin", DateTime(1985, 5, 9)), // 9 Mayıs 1985
    User("Ahmet", "Özden", DateTime(1985, 5, 16)), // 16 Mayıs 1985 (farklı soyisim)
    User("Banu", "Yıldız", DateTime(1985, 5, 23)), // 23 Mayıs 1985
    User("Can", "Balkan", DateTime(1985, 5, 30)), // 30 Mayıs 1985
    User("Dilara", "Sönmez", DateTime(1985, 6, 6)), // 6 Haziran 1985
    User("Emre", "Turan", DateTime(1985, 6, 13)), // 13 Haziran 1985
    User("Elif", "Kaya", DateTime(1993, 4, 19)), // 19 Nisan 1993
    User("Kemal", "Erdem", DateTime(1993, 4, 26)), // 26 Nisan 1993
    User("Zeynep", "Gök", DateTime(1993, 5, 3)), // 3 Mayıs 1993
    User("Mert", "Aydin", DateTime(1993, 5, 10)), // 10 Mayıs 1993
    User("Sude", "Özden", DateTime(1993, 5, 17)), // 17 Mayıs 1993
    User("Tuğçe", "Yıldız", DateTime(1993, 5, 24)), // 24 Mayıs 1993
    User("Umut", "Balkan", DateTime(1993, 5, 31)), // 31 Mayıs 1993
    User("Vildan", "Sönmez", DateTime(1993, 6, 7)), // 7 Haziran 1993
    User("Yağmur", "Turan", DateTime(1993, 6, 14)), // 14 Haziran 1993
    User("İrem", "Kaya", DateTime(1991, 4, 20)), // 20 Nisan 1991
    User("Murat", "Erdem", DateTime(1991, 4, 27)), // 27 Nisan 1991
    User("Nur", "Gök", DateTime(1991, 5, 4)), // 4 Mayıs 1991
    User("Özge", "Aydin", DateTime(1991, 5, 11)), // 11 Mayıs 1991
    User("Pınar", "Özden", DateTime(1991, 5, 18)), // 18 Mayıs 1991
    User("Rüya", "Yıldız", DateTime(1991, 5, 25)), // 25 Mayıs 1991
    User("Serkan", "Balkan", DateTime(1991, 6, 1)), // 1 Haziran 1991
    User("Tuba", "Sönmez", DateTime(1991, 6, 8)), // 8 Haziran 1991
    User("Ulaş", "Turan", DateTime(1991, 6, 15)), // 15 Haziran 1991
    User("Barış", "Kaya", DateTime(1987, 4, 24)), // 24 Nisan 1987
    User("Leyla", "Erdem", DateTime(1987, 5, 1)), // 1 Mayıs 1987
    User("Ozan", "Gök", DateTime(1987, 5, 8)), // 8 Mayıs 1987
    User("Pelin", "Aydin", DateTime(1987, 5, 15)), // 15 Mayıs 1987
    User("Sami", "Özden", DateTime(1987, 5, 22)), // 22 Mayıs 1987
    User("Tuna", "Yıldız", DateTime(1987, 5, 29)), // 29 Mayıs 1987
    User("Ümit", "Balkan", DateTime(1987, 6, 5)), // 5 Haziran 1987
    User("Veli", "Sönmez", DateTime(1987, 6, 12)), // 12 Haziran 1987
  ];

  BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final todaysBirthdays = users.where(
      (user) => user.birthDate.day == today.day && user.birthDate.month == today.month,
    );

    return Card(
      color: AppColors.cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bugün Doğanlar ",
              style: TextStyle(color: AppColors.whiteSpot, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            if (todaysBirthdays.isEmpty) const Text("Bugün doğum günü olan çalışan bulunmamaktadır."),
            ...todaysBirthdays.map(
              (user) => ListTile(
                leading: const Icon(Icons.cake, color: AppColors.whiteSpot, size: 40),
                title: Text(
                  "${user.firstName} ${user.lastName}",
                  style: TextStyle(color: AppColors.whiteSpot, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Doğum Tarihi: ${DateFormat('dd MMMM yyyy', 'tr_TR').format(user.birthDate)}",
                  style: TextStyle(color: AppColors.whiteSpot, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  User(this.firstName, this.lastName, this.birthDate);
}
