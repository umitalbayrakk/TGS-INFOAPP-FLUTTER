import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class BirthdayCard extends StatelessWidget {
  final List<User> users = [
    User("Ahmet", "Yılmaz", DateTime(1990, 4, 11)),
    User("Mehmet", "Kara", DateTime(1985, 4, 11)),
    User("Ayşe", "Demir", DateTime(1993, 4, 12)),
    User("Fatma", "Çelik", DateTime(1991, 4, 13)),
    User("Ali", "Şahin", DateTime(1987, 4, 14)),
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
                  "Doğum Tarihi: ${DateFormat('dd MMMM').format(user.birthDate)}",
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
