import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class BirthdayCard extends StatelessWidget {
  final List<User> users = [
    User("Ahmet", "Yılmaz", DateTime(1990, 4, 14)),
    User("Mehmet", "Kara", DateTime(1985, 4, 11)),
    User("Ayşe", "Demir", DateTime(1993, 4, 12)),
    User("Fatma", "Çelik", DateTime(1991, 4, 13)),
    User("Ayşe", "Çalık", DateTime(1991, 4, 13)),
    User("Ali", "Şahin", DateTime(1987, 4, 17)),
    User("Burak", "Kaya", DateTime(1990, 4, 18)),
    User("Ceren", "Erdem", DateTime(1990, 4, 14)),
    User("Deniz", "Gök", DateTime(1990, 5, 2)),
    User("Ece", "Aydin", DateTime(1990, 5, 9)),
    User("Furkan", "Özden", DateTime(1990, 5, 16)),
    User("Gizem", "Yıldız", DateTime(1990, 5, 23)),
    User("Hakan", "Balkan", DateTime(1990, 5, 30)),
    User("İrem", "Sönmez", DateTime(1990, 6, 6)),
    User("Jale", "Turan", DateTime(1990, 6, 13)),
    User("Efe", "Kaya", DateTime(1985, 4, 18)),
    User("Selin", "Erdem", DateTime(1985, 4, 25)),
    User("Yusuf", "Gök", DateTime(1985, 5, 2)),
    User("Zeynep", "Aydin", DateTime(1985, 5, 9)),
    User("Ahmet", "Özden", DateTime(1985, 5, 16)),
    User("Banu", "Yıldız", DateTime(1985, 5, 23)),
    User("Can", "Balkan", DateTime(1985, 5, 30)),
    User("Dilara", "Sönmez", DateTime(1985, 6, 6)),
    User("Emre", "Turan", DateTime(1985, 4, 16)),
    User("Elif", "Kaya", DateTime(1993, 4, 19)),
    User("Kemal", "Erdem", DateTime(1993, 4, 16)),
    User("Zeynep", "Gök", DateTime(1993, 4, 15)),
    User("Mert", "Aydin", DateTime(1993, 4, 15)),
    User("Sude", "Özden", DateTime(1993, 4, 15)),
    User("Tuğçe", "Yıldız", DateTime(1993, 5, 24)),
    User("Umut", "Balkan", DateTime(1993, 5, 31)),
    User("Vildan", "Sönmez", DateTime(1993, 6, 7)),
    User("Yağmur", "Turan", DateTime(1993, 6, 14)),
    User("İrem", "Kaya", DateTime(1991, 4, 20)),
    User("Murat", "Erdem", DateTime(1991, 4, 27)),
    User("Nur", "Gök", DateTime(1991, 5, 4)),
    User("Özge", "Aydin", DateTime(1991, 5, 11)),
    User("Pınar", "Özden", DateTime(1991, 5, 18)),
    User("Rüya", "Yıldız", DateTime(1991, 5, 25)),
    User("Serkan", "Balkan", DateTime(1991, 6, 1)),
    User("Tuba", "Sönmez", DateTime(1991, 6, 8)),
    User("Ulaş", "Turan", DateTime(1991, 6, 15)),
    User("Barış", "Kaya", DateTime(1987, 4, 24)),
    User("Leyla", "Erdem", DateTime(1987, 5, 1)),
    User("Ozan", "Gök", DateTime(1987, 5, 8)),
    User("Pelin", "Aydin", DateTime(1987, 5, 15)),
    User("Sami", "Özden", DateTime(1987, 5, 22)),
    User("Tuna", "Yıldız", DateTime(1987, 5, 29)),
    User("Ümit", "Balkan", DateTime(1987, 6, 5)),
    User("Veli", "Sönmez", DateTime(1987, 6, 12)),
  ];

  BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final todaysBirthdays = users.where(
      (user) => user.birthDate.day == today.day && user.birthDate.month == today.month,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.customCardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 2, blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bugün Doğanlar ",
              style: TextStyle(color: AppColors.borderColor, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            if (todaysBirthdays.isEmpty) const Text("Bugün doğum günü olan çalışan bulunmamaktadır."),
            ...todaysBirthdays.map(
              (user) => ListTile(
                leading: const Icon(Icons.cake, color: AppColors.borderColor, size: 40),
                title: Text(
                  "${user.firstName} ${user.lastName}",
                  style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Doğum Tarihi: ${DateFormat('dd MMMM yyyy', 'tr_TR').format(user.birthDate)}",
                  style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.w500),
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
