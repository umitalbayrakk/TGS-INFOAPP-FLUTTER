import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class ServiceHoursViewModel with ChangeNotifier {
  final Map<String, List<Map<String, String>>> serviceHoursDTM = {
    'Dünya Ticaret Merkezi': [
      {'time': '09:10'},
      {'time': '10:10'},
      {'time': '10:50'},
      {'time': '11:10'},
      {'time': '12:50'},
      {'time': '13:30'},
      {'time': '14:30'},
      {'time': '15:00'},
      {'time': '15:40'},
      {'time': '16:00'},
      {'time': '16:30'},
      {'time': '17:30'},
    ],
  };
  List<String> get serviceHoursList {
    final hoursList = serviceHoursDTM['Dünya Ticaret Merkezi'] ?? [];
    return hoursList.map((hourMap) => hourMap['time']!).toList();
  }

  final Map<String, List<Map<String, String>>> serviceHours = {
    "Arnavutköy": [
      {"location": "Merkez", "time": "05:15"},
      {"location": "Hadımköy", "time": "05:40"},
      {"location": "Bolluca", "time": "06:00"},
      {"location": "Terkos", "time": "07:45"},
      {"location": "Haraççı", "time": "09:00"},
    ],
    "Ataşehir": [
      {"location": "Merkez", "time": "05.15"},
      {"location": "İçerenköy", "time": "05:30"},
      {"location": "Kayışdağı", "time": "05:50"},
      {"location": "Ferhatpaşa", "time": "06.00"},
      {"location": "Yenişehir", "time": "06.30"},
    ],
    "Avcılar": [
      {"location": "Merkez", "time": "05:30"},
      {"location": "Ambarlı", "time": "07:15"},
      {"location": "Denizköşkler", "time": "08:45"},
      {"location": "Cihangir", "time": "10:30"},
      {"location": "Mustafa Kemal Paşa", "time": "12:00"},
    ],
    "Beşiktaş": [
      {"location": "Ortaköy", "time": "07:00"},
      {"location": "Levent", "time": "09:15"},
      {"location": "Etiler", "time": "11:30"},
      {"location": "Bebek", "time": "13:45"},
      {"location": "Akatlar", "time": "16:00"},
    ],
    "Bağcılar": [
      {"location": "Güneşli", "time": "06:10"},
      {"location": "Mahmutbey", "time": "07:40"},
      {"location": "Yüzyıl", "time": "09:20"},
      {"location": "Demirkapı", "time": "11:10"},
      {"location": "Bağlar", "time": "13:50"},
    ],
    "Bahçelievler": [
      {"location": "Şirinevler", "time": "06:00"},
      {"location": "Yenibosna", "time": "07:30"},
      {"location": "Kocasinan", "time": "09:00"},
      {"location": "Soğanlı", "time": "10:45"},
      {"location": "Bahçelievler Merkez", "time": "12:30"},
    ],
    "Bakırköy": [
      {"location": "Yeşilköy", "time": "06:25"},
      {"location": "Florya", "time": "08:10"},
      {"location": "Ataköy", "time": "09:50"},
      {"location": "Kartaltepe", "time": "11:20"},
      {"location": "Bakırköy Merkez", "time": "13:00"},
    ],
    "Başakşehir": [
      {"location": "Kayaşehir", "time": "05:45"},
      {"location": "Başakşehir Merkez", "time": "07:15"},
      {"location": "Bahçeşehir", "time": "09:00"},
      {"location": "Altınşehir", "time": "10:45"},
      {"location": "Güvercintepe", "time": "12:15"},
    ],
    "Bayrampaşa": [
      {"location": "Yıldırım", "time": "06:05"},
      {"location": "Muratpaşa", "time": "07:50"},
      {"location": "Kocatepe", "time": "09:30"},
      {"location": "Altıntepsi", "time": "11:00"},
      {"location": "Vatan", "time": "12:45"},
    ],
    "Beyoğlu": [
      {"location": "Cihangir", "time": "06:50"},
      {"location": "Taksim", "time": "08:30"},
      {"location": "Kasımpaşa", "time": "10:00"},
      {"location": "Halıcıoğlu", "time": "11:45"},
      {"location": "Piri Paşa", "time": "13:20"},
    ],
    "Büyükçekmece": [
      {"location": "Mimaroba", "time": "05:50"},
      {"location": "Kumburgaz", "time": "07:25"},
      {"location": "Güzelce", "time": "09:10"},
      {"location": "Celaliye", "time": "10:50"},
      {"location": "Büyükçekmece Merkez", "time": "12:30"},
    ],
    "Çatalca": [
      {"location": "Çatalca Merkez", "time": "05:40"},
      {"location": "Kaleiçi", "time": "07:10"},
      {"location": "Ferhatpaşa", "time": "08:50"},
      {"location": "Muratbey", "time": "10:30"},
      {"location": "Ormanlı", "time": "12:10"},
    ],
    "Çekmeköy": [
      {"location": "Çekmeköy Merkez", "time": "06:35"},
      {"location": "Madenler", "time": "08:10"},
      {"location": "Alemdağ", "time": "09:50"},
      {"location": "Taşdelen", "time": "11:30"},
      {"location": "Ömerli", "time": "13:10"},
    ],
    "Esenler": [
      {"location": "Atışalanı", "time": "06:15"},
      {"location": "Oruçreis", "time": "07:55"},
      {"location": "Turgutreis", "time": "09:40"},
      {"location": "Fevzi Çakmak", "time": "11:20"},
      {"location": "Menderes", "time": "13:00"},
    ],
    "Esenyurt": [
      {"location": "Saadetdere", "time": "05:55"},
      {"location": "Kıraç", "time": "07:30"},
      {"location": "Pınar", "time": "09:10"},
      {"location": "Namık Kemal", "time": "10:50"},
      {"location": "Esenyurt Merkez", "time": "12:25"},
    ],
    "Eyüpsultan": [
      {"location": "Göktürk", "time": "06:20"},
      {"location": "Alibeyköy", "time": "08:00"},
      {"location": "Yeşilpınar", "time": "09:40"},
      {"location": "Rami", "time": "11:25"},
      {"location": "Kemerburgaz", "time": "13:05"},
    ],
    "Fatih": [
      {"location": "Sultanahmet", "time": "06:00"},
      {"location": "Eminönü", "time": "07:45"},
      {"location": "Aksaray", "time": "09:25"},
      {"location": "Balat", "time": "11:10"},
      {"location": "Fener", "time": "12:50"},
    ],
    "Gaziosmanpaşa": [
      {"location": "Karadeniz", "time": "06:10"},
      {"location": "Yıldıztabya", "time": "07:50"},
      {"location": "Küçükköy", "time": "09:30"},
      {"location": "Bağlarbaşı", "time": "11:15"},
      {"location": "Fevzi Çakmak", "time": "12:55"},
    ],
    "Güngören": [
      {"location": "Merter", "time": "06:05"},
      {"location": "Güneştepe", "time": "07:40"},
      {"location": "Gençosman", "time": "09:20"},
      {"location": "Sanayi", "time": "11:00"},
      {"location": "Güngören Merkez", "time": "12:40"},
    ],
    "Kadıköy": [
      {"location": "Caddebostan", "time": "06:45"},
      {"location": "Fenerbahçe", "time": "08:25"},
      {"location": "Göztepe", "time": "10:10"},
      {"location": "Koşuyolu", "time": "11:50"},
      {"location": "Moda", "time": "13:30"},
    ],
    "Kağıthane": [
      {"location": "Seyrantepe", "time": "06:30"},
      {"location": "Gültepe", "time": "08:10"},
      {"location": "Çağlayan", "time": "09:45"},
      {"location": "Çeliktepe", "time": "11:25"},
      {"location": "Hamidiye", "time": "13:05"},
    ],
    "Kartal": [
      {"location": "Soğanlık", "time": "06:55"},
      {"location": "Yakacık", "time": "08:40"},
      {"location": "Uğur Mumcu", "time": "10:20"},
      {"location": "Çavuşoğlu", "time": "12:00"},
      {"location": "Kartal Merkez", "time": "13:40"},
    ],
    "Küçükçekmece": [
      {"location": "Halkalı", "time": "06:00"},
      {"location": "Sefaköy", "time": "07:40"},
      {"location": "Atakent", "time": "09:20"},
      {"location": "Kanarya", "time": "11:00"},
      {"location": "İkitelli", "time": "12:40"},
    ],
    "Maltepe": [
      {"location": "Küçükyalı", "time": "06:50"},
      {"location": "Altıntepe", "time": "08:30"},
      {"location": "Zümrütevler", "time": "10:10"},
      {"location": "Bağlarbaşı", "time": "11:50"},
      {"location": "Maltepe Merkez", "time": "13:30"},
    ],
    "Pendik": [
      {"location": "Kaynarca", "time": "06:40"},
      {"location": "Çamçeşme", "time": "08:20"},
      {"location": "Yenişehir", "time": "10:00"},
      {"location": "Güzelyalı", "time": "11:40"},
      {"location": "Pendik Merkez", "time": "13:20"},
    ],
    "Sancaktepe": [
      {"location": "Yenidoğan", "time": "06:30"},
      {"location": "Sarıgazi", "time": "08:10"},
      {"location": "Osmangazi", "time": "09:50"},
      {"location": "Emek", "time": "11:30"},
      {"location": "Sancaktepe Merkez", "time": "13:10"},
    ],
    "Sarıyer": [
      {"location": "Maslak", "time": "06:15"},
      {"location": "Tarabya", "time": "08:00"},
      {"location": "Yeniköy", "time": "09:40"},
      {"location": "İstinye", "time": "11:20"},
      {"location": "Zekeriyaköy", "time": "13:00"},
    ],
    "Silivri": [
      {"location": "Silivri Merkez", "time": "05:50"},
      {"location": "Selimpaşa", "time": "07:30"},
      {"location": "Çanta", "time": "09:10"},
      {"location": "Kavaklı", "time": "10:50"},
      {"location": "Gümüşyaka", "time": "12:30"},
    ],
    "Sultanbeyli": [
      {"location": "Adil", "time": "06:35"},
      {"location": "Ahmet Yesevi", "time": "08:15"},
      {"location": "Battalgazi", "time": "09:55"},
      {"location": "Hasanpaşa", "time": "11:35"},
      {"location": "Sultanbeyli Merkez", "time": "13:15"},
    ],
    "Sultangazi": [
      {"location": "Cebeci", "time": "06:05"},
      {"location": "Habibler", "time": "07:50"},
      {"location": "Yayla", "time": "09:30"},
      {"location": "Gazi", "time": "11:10"},
      {"location": "İsmetpaşa", "time": "12:50"},
    ],
    "Şile": [
      {"location": "Şile Merkez", "time": "05:40"},
      {"location": "Ağva", "time": "07:20"},
      {"location": "Kumbaba", "time": "09:00"},
      {"location": "Balibey", "time": "10:40"},
      {"location": "Çavuş", "time": "12:20"},
    ],
    "Şişli": [
      {"location": "Mecidiyeköy", "time": "06:45"},
      {"location": "Nişantaşı", "time": "08:25"},
      {"location": "Fulya", "time": "10:00"},
      {"location": "Okmeydanı", "time": "11:45"},
      {"location": "Harbiye", "time": "13:30"},
    ],
    "Tuzla": [
      {"location": "Aydıntepe", "time": "06:55"},
      {"location": "İçmeler", "time": "08:35"},
      {"location": "Orhanlı", "time": "10:15"},
      {"location": "Yayla", "time": "11:55"},
      {"location": "Tuzla Merkez", "time": "13:35"},
    ],
    "Ümraniye": [
      {"location": "Çakmak", "time": "06:20"},
      {"location": "Dudullu", "time": "08:00"},
      {"location": "Yukarı Dudullu", "time": "09:40"},
      {"location": "Esenevler", "time": "11:20"},
      {"location": "Ümraniye Merkez", "time": "13:00"},
    ],
    "Üsküdar": [
      {"location": "Çengelköy", "time": "06:30"},
      {"location": "Kuzguncuk", "time": "08:10"},
      {"location": "Acıbadem", "time": "09:50"},
      {"location": "Bağlarbaşı", "time": "11:30"},
      {"location": "Selamiçeşme", "time": "13:10"},
    ],
    "Zeytinburnu": [
      {"location": "Kazlıçeşme", "time": "06:10"},
      {"location": "Veliefendi", "time": "07:50"},
      {"location": "Çırpıcı", "time": "09:30"},
      {"location": "Sümer", "time": "11:10"},
      {"location": "Zeytinburnu Merkez", "time": "12:50"},
    ],
  };

  final Map<String, LatLng> _districtCoordinates = {
    'Arnavutköy': LatLng(41.1956, 28.7402),
    'Ataşehir': LatLng(40.9922, 29.1244),
    'Avcılar': LatLng(40.9790, 28.7210),
    'Beşiktaş': LatLng(41.0438, 29.0094),
  };
  String _selectedDistrict = 'Arnavutköy';
  var user;

  
  ServiceHoursViewModel({required Map<String, String> user}) {
    _initializeSelectedDistrict(user);
  }

  void _initializeSelectedDistrict(Map<String, String> user) {
    String? userLocation = user['location']?.trim();
    String? userName = user['name']?.trim();
    print("ServiceHoursViewModel: Kullanıcı: $userName, Konum: $userLocation");

    if (userLocation == null || userLocation.isEmpty) {
      print("Uyarı: Kullanıcının konumu null veya boş! Varsayılan atanıyor.");
      _selectedDistrict = 'Arnavutköy';
    } else {
      String normalizedLocation = userLocation.toLowerCase().trim();
      _selectedDistrict = serviceHours.keys.firstWhere(
        (key) => key.toLowerCase() == normalizedLocation,
        orElse: () => 'Arnavutköy',
      );
    }
    print("ServiceHoursViewModel: Seçilen İlçe: $_selectedDistrict");
    notifyListeners();
  }

  String get selectedDistrict => _selectedDistrict;

  List<Map<String, String>> get serviceHoursForDistrict => serviceHours[_selectedDistrict] ?? [];

  Map<String, LatLng> get districtCoordinates => _districtCoordinates;
}
