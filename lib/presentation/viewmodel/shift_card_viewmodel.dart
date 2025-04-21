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
  static const List<Map<String, String>> shiftPlan = [
    {'A': 'Sabah', 'B': 'Akşam', 'C': 'Gece', 'D': 'İzin'}, // 17 Nisan 2025
    {'A': 'Sabah', 'B': 'Akşam', 'C': 'Gece', 'D': 'İzin'}, // 18 Nisan 2025
    {'A': 'Akşam', 'B': 'Gece', 'C': 'İzin', 'D': 'Sabah'}, // 19 Nisan 2025
    {'A': 'Akşam', 'B': 'Gece', 'C': 'İzin', 'D': 'Sabah'}, // 20 Nisan 2025
    {'A': 'Gece', 'B': 'İzin', 'C': 'Sabah', 'D': 'Akşam'}, // 21 Nisan 2025
    {'A': 'Gece', 'B': 'İzin', 'C': 'Sabah', 'D': 'Akşam'}, // 22 Nisan 2025
    {'A': 'İzin', 'B': 'Sabah', 'C': 'Akşam', 'D': 'Gece'}, // 23 Nisan 2025
    {'A': 'İzin', 'B': 'Sabah', 'C': 'Akşam', 'D': 'Gece'}, // 24 Nisan 2025
    {'A': 'Sabah', 'B': 'Akşam', 'C': 'Gece', 'D': 'İzin'}, // 25 Nisan 2025
    {'A': 'Sabah', 'B': 'Akşam', 'C': 'Gece', 'D': 'İzin'}, // 26 Nisan 2025
    {'A': 'Akşam', 'B': 'Gece', 'C': 'İzin', 'D': 'Sabah'}, // 27 Nisan 2025
    {'A': 'Akşam', 'B': 'Gece', 'C': 'İzin', 'D': 'Sabah'}, // 28 Nisan 2025
    {'A': 'Gece', 'B': 'İzin', 'C': 'Sabah', 'D': 'Akşam'}, // 29 Nisan 2025
    {'A': 'Gece', 'B': 'İzin', 'C': 'Sabah', 'D': 'Akşam'}, // 30 Nisan 2025
    {'A': 'İzin', 'B': 'Sabah', 'C': 'Akşam', 'D': 'Gece'}, // 1 Mayıs 2025
    {'A': 'İzin', 'B': 'Sabah', 'C': 'Akşam', 'D': 'Gece'}, // 2 Mayıs 2025
    {'A': 'Sabah', 'B': 'Akşam', 'C': 'Gece', 'D': 'İzin'}, // 3 Mayıs 2025
    {'A': 'Sabah', 'B': 'Akşam', 'C': 'Gece', 'D': 'İzin'}, // 4 Mayıs 2025
    {'A': 'Akşam', 'B': 'Gece', 'C': 'İzin', 'D': 'Sabah'}, // 5 Mayıs 2025
    {'A': 'Akşam', 'B': 'Gece', 'C': 'İzin', 'D': 'Sabah'}, // 6 Mayıs 2025
    {'A': 'Gece', 'B': 'İzin', 'C': 'Sabah', 'D': 'Akşam'}, // 7 Mayıs 2025
    {'A': 'Gece', 'B': 'İzin', 'C': 'Sabah', 'D': 'Akşam'}, // 8 Mayıs 2025
    {'A': 'İzin', 'B': 'Sabah', 'C': 'Akşam', 'D': 'Gece'}, // 9 Mayıs 2025
    {'A': 'İzin', 'B': 'Sabah', 'C': 'Akşam', 'D': 'Gece'}, // 10 Mayıs 2025
    {'A': 'Sabah', 'B': 'Akşam', 'C': 'Gece', 'D': 'İzin'}, // 11 Mayıs 2025
    {'A': 'Sabah', 'B': 'Akşam', 'C': 'Gece', 'D': 'İzin'}, // 12 Mayıs 2025
    {'A': 'Akşam', 'B': 'Gece', 'C': 'İzin', 'D': 'Sabah'}, // 13 Mayıs 2025
    {'A': 'Akşam', 'B': 'Gece', 'C': 'İzin', 'D': 'Sabah'}, // 14 Mayıs 2025
  ];

  // Saat 06:30-14:30 arası Sabah, 14:30-22:30 arası Akşam, diğer saatler Gece
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

  // Verilen tarih ve saate göre vardiya planını döndürür
  // Saat 00:00-06:30 arasında bir önceki günün Gece vardiyası aktif olduğu için
  // bir önceki günün vardiya planını kullanır56.55...
  Map<String, String> getTodayShift(DateTime dateTime) {
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    double time = hour + minute / 60.0;

    DateTime startDate = DateTime(2025, 4, 17);
    DateTime effectiveDate;

    // Saat 00:00-06:30 arasındaysa, bir önceki günün Gece vardiyası aktif
    if (time >= 0.0 && time < 6.5) {
      effectiveDate = dateTime.subtract(Duration(days: 1));
    } else {
      effectiveDate = dateTime;
    }
    int dayIndex = effectiveDate.difference(startDate).inDays;
    int cycleDay = dayIndex % 28;
    return shiftPlan[cycleDay];
  }

  String? getActiveTeam(DateTime dateTime) {
    String currentShift = getCurrentShift(dateTime);
    Map<String, String> todayShift = getTodayShift(dateTime);
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
    return DateFormat('dd.MM.YYYY').format(date);
  }

  String? getShiftByTeamAndDate(String team, DateTime dateTime) {
    Map<String, String> todayShift = getTodayShift(dateTime);
    return todayShift[team];
  }
}
