import 'package:intl/intl.dart';

class ShiftViewModel {
  // Vardiya ve ekip bilgileri
  static const List<String> teams = ['A', 'B', 'C', 'D'];
  static const Map<String, String> shiftTimes = {
    'Sabah': '06:30 - 14:30',
    'Akşam': '14:30 - 22:30',
    'Gece': '22:30 - 06:30',
  };

  // Örnek ekip üyeleri.
  static const Map<String, List<String>> teamMembers = {
    'A': ['Ahmet Yılmaz', 'Ayşe Kaya', 'Mehmet Demir'],
    'B': ['Fatma Şahin', 'Ali Veli', 'Zeynep Çelik'],
    'C': ['Hasan Öztürk', 'Elif Aydın', 'Murat Can'],
    'D': ['Selin Korkmaz', 'Burak Arslan', 'Esra Yavuz'],
  };

  // Mevcut saate göre aktif vardiyayı belirleyen fonksiyon
  String getCurrentShift(DateTime now) {
    int hour = now.hour;

    if (hour >= 8 && hour < 16) {
      return 'Sabah';
    } else if (hour >= 16 && hour < 24) {
      return 'Akşam';
    } else {
      return 'Gece';
    }
  }

  // Vardiya planını hesaplayan fonksiyon
  Map<String, String> getTodayShift(DateTime date) {
    int dayIndex = date.difference(DateTime(date.year, date.month, 1)).inDays;
    int cycleDay = dayIndex % 4; // 4 günlük döngü

    // Her ekip için vardiya sırası
    List<Map<String, String>> shiftPlan = [
      {'A': 'Sabah', 'B': 'İzin', 'C': 'Gece', 'D': 'Akşam'},
      {'A': 'Akşam', 'B': 'Sabah', 'C': 'İzin', 'D': 'Gece'},
      {'A': 'Gece', 'B': 'Akşam', 'C': 'Sabah', 'D': 'İzin'},
      {'A': 'İzin', 'B': 'Gece', 'C': 'Akşam', 'D': 'Sabah'},
    ];
    return shiftPlan[cycleDay];
  }

  // Aktif vardiyadaki ekibi bulan fonksiyon
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

  // Ekip üyelerini döndüren fonksiyon
  List<String> getTeamMembers(String team) {
    return teamMembers[team] ?? [];
  }

  // Vardiya saatlerini döndüren fonksiyon
  String getShiftTime(String shift) {
    return shiftTimes[shift] ?? '---';
  }

  // Tarih
  String getFormattedDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }
}