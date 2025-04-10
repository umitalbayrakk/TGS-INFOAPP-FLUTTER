// phone_numbers_view_model.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/model/contact_model/contact.model.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneNumbersViewModel extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<Contact> _contacts = [];
  late SharedPreferences _prefs;

  PhoneNumbersViewModel() {
    _init();
  }
  List<Contact> get contacts => _contacts;
  List<Contact> get filteredContacts {
    final searchTerm = searchController.text.toLowerCase();
    return _contacts.where((contact) {
      final fullName = '${contact.name} ${contact.surname}'.toLowerCase();
      final phone = contact.phone.toLowerCase();
      return fullName.contains(searchTerm) || phone.contains(searchTerm);
    }).toList();
  }
  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadContacts();
    searchController.addListener(notifyListeners);
  }

  Future<void> _loadContacts() async {
    final String? contactsJson = _prefs.getString('contacts');
    if (contactsJson != null) {
      final List<dynamic> decodedList = jsonDecode(contactsJson);
      _contacts = decodedList.map((item) => Contact.fromJson(item)).toList();
    } else {
      _contacts = [
        Contact(name: 'Ahmet', surname: 'Yılmaz', birthDate: '01/05/1990', phone: '05551234567'),
        Contact(name: 'Fatma', surname: 'Kara', birthDate: '15/03/1985', phone: '05559876543'),
        Contact(name: 'Mehmet', surname: 'Demir', birthDate: '20/12/1995', phone: '05554321987'),
        Contact(name: 'Ayşe', surname: 'Çelik', birthDate: '10/08/1988', phone: '05557654321'),
        Contact(name: 'Ali', surname: 'Kaya', birthDate: '25/11/1992', phone: '05556789012'),
        Contact(name: 'Zeynep', surname: 'Şahin', birthDate: '30/04/1997', phone: '05552345678'),
        Contact(name: 'Hasan', surname: 'Köse', birthDate: '12/09/1983', phone: '05553456789'),
        Contact(name: 'Burak', surname: 'Aydin', birthDate: '03/07/1991', phone: '05551234568'),
        Contact(name: 'Elif', surname: 'Öztürk', birthDate: '22/01/1986', phone: '05559876544'),
        Contact(name: 'Cem', surname: 'Ergün', birthDate: '14/06/1996', phone: '05554321988'),
        Contact(name: 'Selin', surname: 'Yıldız', birthDate: '19/03/1989', phone: '05557654322'),
        Contact(name: 'Eren', surname: 'Güneş', birthDate: '28/12/1993', phone: '05556789013'),
        Contact(name: 'Defne', surname: 'Aslan', birthDate: '05/09/1998', phone: '05552345679'),
        Contact(name: 'Kaan', surname: 'Başar', birthDate: '17/04/1984', phone: '05553456790'),
        Contact(name: 'Sude', surname: 'Can', birthDate: '09/11/1990', phone: '05554567890'),
        Contact(name: 'Yiğit', surname: 'Toprak', birthDate: '30/08/1987', phone: '05555678901'),
        Contact(name: 'Lale', surname: 'Doğan', birthDate: '12/02/1994', phone: '05556790123'),
        Contact(name: 'Ozan', surname: 'Uçar', birthDate: '25/05/1982', phone: '05557890123'),
        Contact(name: 'Aylin', surname: 'Aksoy', birthDate: '08/10/1999', phone: '05558901234'),
        Contact(name: 'Tuna', surname: 'Boz', birthDate: '15/07/1985', phone: '05559012345'),
        Contact(name: 'Nisan', surname: 'Çınar', birthDate: '20/03/1992', phone: '05550123456'),
        Contact(name: 'Barış', surname: 'Erdem', birthDate: '07/06/1988', phone: '05551234569'),
        Contact(name: 'Ece', surname: 'Fidan', birthDate: '11/09/1995', phone: '05559876545'),
        Contact(name: 'Caner', surname: 'Gök', birthDate: '03/12/1983', phone: '05554321989'),
        Contact(name: 'Ipek', surname: 'Hançer', birthDate: '27/04/1997', phone: '05557654323'),
        Contact(name: 'Umut', surname: 'İpek', birthDate: '16/01/1990', phone: '05556789014'),
        Contact(name: 'Beren', surname: 'Jale', birthDate: '22/08/1986', phone: '05552345680'),
        Contact(name: 'Deniz', surname: 'Kara', birthDate: '14/03/1994', phone: '05553456791'),
        Contact(name: 'Ferit', surname: 'Lale', birthDate: '09/06/1989', phone: '05554567891'),
        Contact(name: 'Gizem', surname: 'Mavi', birthDate: '30/11/1996', phone: '05555678902'),
        Contact(name: 'Hakan', surname: 'Naz', birthDate: '05/02/1985', phone: '05556790124'),
        Contact(name: 'İrem', surname: 'Okyay', birthDate: '18/07/1993', phone: '05557890124'),
        Contact(name: 'Jülide', surname: 'Poyraz', birthDate: '25/04/1987', phone: '05558901235'),
        Contact(name: 'Kemal', surname: 'Rüzgar', birthDate: '12/09/1998', phone: '05559012346'),
        Contact(name: 'Leyla', surname: 'Sarp', birthDate: '08/01/1984', phone: '05550123457'),
        Contact(name: 'Mert', surname: 'Taş', birthDate: '15/10/1991', phone: '05551234570'),
        Contact(name: 'Nur', surname: 'Uğur', birthDate: '20/05/1986', phone: '05559876546'),
        Contact(name: 'Onur', surname: 'Vural', birthDate: '03/08/1995', phone: '05554321990'),
        Contact(name: 'Pınar', surname: 'Yalçın', birthDate: '27/02/1989', phone: '05557654324'),
        Contact(name: 'Rıza', surname: 'Zeybek', birthDate: '16/11/1997', phone: '05556789015'),
        Contact(name: 'Sema', surname: 'Atay', birthDate: '22/06/1983', phone: '05552345681'),
        Contact(name: 'Tolga', surname: 'Bolat', birthDate: '14/09/1990', phone: '05553456792'),
        Contact(name: 'Ümit', surname: 'Çelik', birthDate: '09/03/1988', phone: '05554567892'),
        Contact(name: 'Vildan', surname: 'Demir', birthDate: '30/12/1996', phone: '05555678903'),
        Contact(name: 'Yağmur', surname: 'Efe', birthDate: '05/07/1985', phone: '05556790125'),
        Contact(name: 'Zeki', surname: 'Fırat', birthDate: '18/04/1993', phone: '05557890125'),
        Contact(name: 'Aslı', surname: 'Göz', birthDate: '25/01/1987', phone: '05558901236'),
        Contact(name: 'Bülent', surname: 'Hız', birthDate: '12/06/1998', phone: '05559012347'),
        Contact(name: 'Ceren', surname: 'İnan', birthDate: '08/09/1984', phone: '05550123458'),
        Contact(name: 'Duygu', surname: 'Kaya', birthDate: '15/02/1991', phone: '05551234571'),
        Contact(name: 'Emir', surname: 'Lütfi', birthDate: '20/08/1986', phone: '05559876547'),
        Contact(name: 'Fatih', surname: 'Murat', birthDate: '03/05/1995', phone: '05554321991'),
        Contact(name: 'Gökhan', surname: 'Nehir', birthDate: '27/10/1989', phone: '05557654325'),
        Contact(name: 'Hale', surname: 'Öz', birthDate: '16/03/1997', phone: '05556789016'),
        Contact(name: 'İdil', surname: 'Pek', birthDate: '22/07/1983', phone: '05552345682'),
        Contact(name: 'Jale', surname: 'Quş', birthDate: '14/11/1990', phone: '05553456793'),
        Contact(name: 'Kıvanç', surname: 'Rana', birthDate: '09/04/1988', phone: '05554567893'),
        Contact(name: 'Lütfiye', surname: 'Sönmez', birthDate: '30/06/1996', phone: '05555678904'),
        Contact(name: 'Melis', surname: 'Turan', birthDate: '05/09/1985', phone: '05556790126'),
        Contact(name: 'Nihat', surname: 'Ünal', birthDate: '18/12/1993', phone: '05557890126'),
        Contact(name: 'Oğuz', surname: 'Varol', birthDate: '25/03/1987', phone: '05558901237'),
        Contact(name: 'Pelin', surname: 'Yılmaz', birthDate: '12/08/1998', phone: '05559012348'),
        Contact(name: 'Recep', surname: 'Zengin', birthDate: '08/01/1984', phone: '05550123459'),
        Contact(name: 'Serhat', surname: 'Acar', birthDate: '15/05/1991', phone: '05551234572'),
        Contact(name: 'Tuğçe', surname: 'Berk', birthDate: '20/10/1986', phone: '05559876548'),
        Contact(name: 'Ulaş', surname: 'Cengiz', birthDate: '03/07/1995', phone: '05554321992'),
        Contact(name: 'Veysel', surname: 'Duman', birthDate: '27/02/1989', phone: '05557654326'),
        Contact(name: 'Yasemin', surname: 'Ekinci', birthDate: '16/09/1997', phone: '05556789017'),
        Contact(name: 'Zerrin', surname: 'Fener', birthDate: '22/04/1983', phone: '05552345683'),
        Contact(name: 'Adem', surname: 'Gül', birthDate: '14/06/1990', phone: '05553456794'),
        Contact(name: 'Belgin', surname: 'Hacılar', birthDate: '09/11/1988', phone: '05554567894'),
        Contact(name: 'Cavit', surname: 'İmre', birthDate: '30/03/1996', phone: '05555678905'),
        Contact(name: 'Derya', surname: 'Kocatepe', birthDate: '05/08/1985', phone: '05556790127'),
        Contact(name: 'Ersin', surname: 'Lodos', birthDate: '18/01/1993', phone: '05557890127'),
        Contact(name: 'Funda', surname: 'Menderes', birthDate: '25/07/1987', phone: '05558901238'),
        Contact(name: 'Gülden', surname: 'Nalbant', birthDate: '12/10/1998', phone: '05559012349'),
        Contact(name: 'Halil', surname: 'Özkan', birthDate: '08/04/1984', phone: '05550123460'),
        Contact(name: 'İsmet', surname: 'Pazar', birthDate: '15/09/1991', phone: '05551234573'),
        Contact(name: 'Jehan', surname: 'Rıfat', birthDate: '20/02/1986', phone: '05559876549'),
        Contact(name: 'Kader', surname: 'Saka', birthDate: '03/06/1995', phone: '05554321993'),
        Contact(name: 'Levent', surname: 'Tamer', birthDate: '27/11/1989', phone: '05557654327'),
        Contact(name: 'Merve', surname: 'Uğur', birthDate: '16/05/1997', phone: '05556789018'),
        Contact(name: 'Nazlı', surname: 'Veli', birthDate: '22/08/1983', phone: '05552345684'),
        Contact(name: 'Orhan', surname: 'Yıldırım', birthDate: '14/12/1990', phone: '05553456795'),
        Contact(name: 'Poyraz', surname: 'Zorlu', birthDate: '09/07/1988', phone: '05554567895'),
        Contact(name: 'Rüya', surname: 'Akyol', birthDate: '30/10/1996', phone: '05555678906'),
        Contact(name: 'Sarp', surname: 'Balkan', birthDate: '05/03/1985', phone: '05556790128'),
        Contact(name: 'Tamer', surname: 'Çelik', birthDate: '18/06/1993', phone: '05557890128'),
        Contact(name: 'Utku', surname: 'Duru', birthDate: '25/09/1987', phone: '05558901239'),
        Contact(name: 'Volkan', surname: 'Ertuğ', birthDate: '12/02/1998', phone: '05559012350'),
        Contact(name: 'Yavuz', surname: 'Fidan', birthDate: '08/05/1984', phone: '05550123461'),
        Contact(name: 'Zehra', surname: 'Göztepe', birthDate: '15/08/1991', phone: '05551234574'),
        Contact(name: 'Alper', surname: 'Hızlı', birthDate: '20/01/1986', phone: '05559876550'),
        Contact(name: 'Bahar', surname: 'İnce', birthDate: '03/04/1995', phone: '05554321994'),
        Contact(name: 'Cihan', surname: 'Jale', birthDate: '27/07/1989', phone: '05557654328'),
        Contact(name: 'Dilara', surname: 'Kara', birthDate: '16/11/1997', phone: '05556789019'),
        Contact(name: 'Enes', surname: 'Lale', birthDate: '22/03/1983', phone: '05552345685'),
        Contact(name: 'Feriha', surname: 'Mavi', birthDate: '14/06/1990', phone: '05553456796'),
        Contact(name: 'Gamze', surname: 'Naz', birthDate: '09/09/1988', phone: '05554567896'),
        Contact(name: 'Hüseyin', surname: 'Okyay', birthDate: '30/12/1996', phone: '05555678907'),
        Contact(name: 'İlker', surname: 'Poyraz', birthDate: '05/02/1985', phone: '05556790129'),
        Contact(name: 'Jale', surname: 'Rüzgar', birthDate: '18/05/1993', phone: '05557890129'),
        Contact(name: 'Kerem', surname: 'Sarp', birthDate: '25/08/1987', phone: '05558901240'),
        Contact(name: 'Lale', surname: 'Taş', birthDate: '12/11/1998', phone: '05559012351'),
        Contact(name: 'Mehmet', surname: 'Uğur', birthDate: '08/03/1984', phone: '05550123462'),
        Contact(name: 'Nermin', surname: 'Vural', birthDate: '15/06/1991', phone: '05551234575'),
        Contact(name: 'Oktay', surname: 'Yalçın', birthDate: '20/09/1986', phone: '05559876551'),
        Contact(name: 'Pervin', surname: 'Zeybek', birthDate: '03/12/1995', phone: '05554321995'),
        Contact(name: 'Rabia', surname: 'Atay', birthDate: '27/04/1989', phone: '05557654329'),
        Contact(name: 'Sercan', surname: 'Bolat', birthDate: '16/07/1997', phone: '05556789020'),
        Contact(name: 'Tülay', surname: 'Çelik', birthDate: '22/10/1983', phone: '05552345686'),
        Contact(name: 'Uğur', surname: 'Demir', birthDate: '14/01/1990', phone: '05553456797'),
        Contact(name: 'Veli', surname: 'Efe', birthDate: '09/05/1988', phone: '05554567897'),
        Contact(name: 'Yıldız', surname: 'Fırat', birthDate: '30/08/1996', phone: '05555678908'),
        Contact(name: 'Zeynel', surname: 'Göz', birthDate: '05/11/1985', phone: '05556790130'),
        Contact(name: 'Arda', surname: 'Hız', birthDate: '18/02/1993', phone: '05557890130'),
        Contact(name: 'Banu', surname: 'İnan', birthDate: '25/07/1987', phone: '05558901241'),
        Contact(name: 'Can', surname: 'Kaya', birthDate: '12/10/1998', phone: '05559012352'),
        Contact(name: 'Demet', surname: 'Lütfi', birthDate: '08/04/1984', phone: '05550123463'),
        Contact(name: 'Ege', surname: 'Murat', birthDate: '15/09/1991', phone: '05551234576'),
        Contact(name: 'Figen', surname: 'Nehir', birthDate: '20/12/1986', phone: '05559876552'),
        Contact(name: 'Güney', surname: 'Öz', birthDate: '03/03/1995', phone: '05554321996'),
        Contact(name: 'Hande', surname: 'Pek', birthDate: '27/06/1989', phone: '05557654330'),
        Contact(name: 'İnci', surname: 'Quş', birthDate: '16/09/1997', phone: '05556789021'),
        Contact(name: 'Jülide', surname: 'Rana', birthDate: '22/02/1983', phone: '05552345687'),
        Contact(name: 'Kutlu', surname: 'Sönmez', birthDate: '14/05/1990', phone: '05553456798'),
        Contact(name: 'Lina', surname: 'Turan', birthDate: '09/08/1988', phone: '05554567898'),
        Contact(name: 'Murat', surname: 'Ünal', birthDate: '30/11/1996', phone: '05555678909'),
        Contact(name: 'Nazan', surname: 'Varol', birthDate: '05/04/1985', phone: '05556790131'),
        Contact(name: 'Olcay', surname: 'Yılmaz', birthDate: '18/07/1993', phone: '05557890131'),
        Contact(name: 'Polat', surname: 'Zengin', birthDate: '25/10/1987', phone: '05558901242'),
        Contact(name: 'Ruken', surname: 'Acar', birthDate: '12/03/1998', phone: '05559012353'),
        Contact(name: 'Safa', surname: 'Berk', birthDate: '08/06/1984', phone: '05550123464'),
        Contact(name: 'Tarık', surname: 'Cengiz', birthDate: '15/09/1991', phone: '05551234577'),
        Contact(name: 'Ülkü', surname: 'Duman', birthDate: '20/12/1986', phone: '05559876553'),
        Contact(name: 'Vahap', surname: 'Ekinci', birthDate: '03/05/1995', phone: '05554321997'),
        Contact(name: 'Yaren', surname: 'Fener', birthDate: '27/08/1989', phone: '05557654331'),
        Contact(name: 'Ziya', surname: 'Gül', birthDate: '16/11/1997', phone: '05556789022'),
      ];
      await _saveContacts();
    }
    notifyListeners();
  }

  Future<void> _saveContacts() async {
    final String contactsJson = jsonEncode(_contacts.map((contact) => contact.toJson()).toList());
    await _prefs.setString('contacts', contactsJson);
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    try {
      String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
      if (cleanedNumber.isEmpty) throw Exception("Numara boş veya geçersiz.");
      if (cleanedNumber.startsWith('0')) {
        cleanedNumber = '+90${cleanedNumber.substring(1)}';
      } else if (!cleanedNumber.startsWith('+')) {
        cleanedNumber = '+90$cleanedNumber';
      }
      final Uri launchUri = Uri(scheme: 'tel', path: cleanedNumber);
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        throw Exception("Arama başlatılamadı. URI: $launchUri");
      }
    } catch (e) {}
  }

  void addNewContact(String name, String surname, String birthDate, String phone) {
    if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
      final newContact = Contact(name: name, surname: surname, birthDate: birthDate, phone: phone);
      _contacts.insert(0, newContact);
      _saveContacts();
      notifyListeners();
    } else {
      throw Exception('Lütfen tüm alanları doldurun!');
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
