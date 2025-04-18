import 'package:intl/intl.dart';

class ShiftViewModel {
  static const List<String> teams = ['A', 'B', 'C', 'D'];

  static const Map<String, String> shiftTimes = {
    'Sabah': '06:30 - 14:30',
    'Akşam': '14:30 - 22:30',
    'Gece': '22:30 - 06:30',
  };

  static const Map<String, List<String>> teamMembers = {
    'A': ['Ahmet Yılmaz', 'Ayşe Kaya', 'Mehmet Demir'],
    'B': ['Fatma Şahin', 'Ali Veli', 'Zeynep Çelik'],
    'C': ['Hasan Öztürk', 'Elif Aydın', 'Murat Can'],
    'D': ['Selin Korkmaz', 'Burak Arslan', 'Esra Yavuz'],
  };

  String getCurrentShift(DateTime now) {
    int hour = now.hour;
    int minute = now.minute;
    double time = hour + minute / 60.0;
    if (time >= 6.5 && time < 14.5) {
      return 'Sabah';
    } else if (time >= 14.5 && time < 22.5) {
      return 'Akşam';
    } else {
      return 'Gece';
    }
  }

  Map<String, String> getTodayShift(DateTime date) {
    DateTime startDate = DateTime(2025, 4, 17); // A ekibi sabahla başlıyor
    int dayIndex = date.difference(startDate).inDays;

    List<String> teamOrder = ['A', 'B', 'C', 'D'];
    int sabahciIndex = dayIndex % 4;

    String sabahci = teamOrder[sabahciIndex];
    String aksamci = teamOrder[(sabahciIndex + 1) % 4];
    String gececi = teamOrder[(sabahciIndex + 2) % 4];
    String izinli = teamOrder[(sabahciIndex + 3) % 4];

    return {sabahci: 'Sabah', aksamci: 'Akşam', gececi: 'Gece', izinli: 'İzin'};
  }

  String? getActiveTeam(DateTime date) {
    String currentShift = getCurrentShift(date);
    Map<String, String> todayShift = getTodayShift(date);
    for (var entry in todayShift.entries) {
      if (entry.value == currentShift) {
        return entry.key;
      }
    }
    return null;
  }

  List<String> getTeamMembers(String team) {
    return teamMembers[team] ?? [];
  }
  String getShiftTime(String shift) {
    return shiftTimes[shift] ?? '---';
  }

  String getFormattedDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  String? getShiftByTeamAndDate(String team, DateTime date) {
    Map<String, String> todayShift = getTodayShift(date);
    return todayShift[team];
  }
}

//28 günlük döngü var.

//Her 2 günde bir ekipler bir sonraki vardiyaya geçiyor.

//Sabah → Akşam → Gece → İzin şeklinde sırayla dönüyorlar.

//Her ekip 6 gün çalışıp 2 gün izin yapmış oluyor.
