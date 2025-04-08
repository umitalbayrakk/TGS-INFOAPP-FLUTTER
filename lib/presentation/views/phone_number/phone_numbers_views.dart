import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';
import 'package:tgs_info_app_flutter/widgets/drawer/custom_drawer_view.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneNumbersViews extends StatefulWidget {
  const PhoneNumbersViews({super.key});

  @override
  State<PhoneNumbersViews> createState() => _PhoneNumbersViewsState();
}

class _PhoneNumbersViewsState extends State<PhoneNumbersViews> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> contacts = [
    {'name': 'Ahmet', 'surname': 'Yılmaz', 'birthDate': '01/05/1990', 'phone': '05551234567'},
    {'name': 'Fatma', 'surname': 'Kara', 'birthDate': '15/03/1985', 'phone': '05559876543'},
    {'name': 'Mehmet', 'surname': 'Demir', 'birthDate': '20/12/1995', 'phone': '05554321987'},
    {'name': 'Ayşe', 'surname': 'Çelik', 'birthDate': '10/08/1988', 'phone': '05557654321'},
    {'name': 'Ali', 'surname': 'Kaya', 'birthDate': '25/11/1992', 'phone': '05556789012'},
    {'name': 'Zeynep', 'surname': 'Şahin', 'birthDate': '30/04/1997', 'phone': '05552345678'},
    {'name': 'Hasan', 'surname': 'Köse', 'birthDate': '12/09/1983', 'phone': '05553456789'},
    {'name': 'Burak', 'surname': 'Aydin', 'birthDate': '03/07/1991', 'phone': '05551234568'},
    {'name': 'Elif', 'surname': 'Öztürk', 'birthDate': '22/01/1986', 'phone': '05559876544'},
    {'name': 'Cem', 'surname': 'Ergün', 'birthDate': '14/06/1996', 'phone': '05554321988'},
    {'name': 'Selin', 'surname': 'Yıldız', 'birthDate': '19/03/1989', 'phone': '05557654322'},
    {'name': 'Eren', 'surname': 'Güneş', 'birthDate': '28/12/1993', 'phone': '05556789013'},
    {'name': 'Defne', 'surname': 'Aslan', 'birthDate': '05/09/1998', 'phone': '05552345679'},
    {'name': 'Kaan', 'surname': 'Başar', 'birthDate': '17/04/1984', 'phone': '05553456790'},
    {'name': 'Sude', 'surname': 'Can', 'birthDate': '09/11/1990', 'phone': '05554567890'},
    {'name': 'Yiğit', 'surname': 'Toprak', 'birthDate': '30/08/1987', 'phone': '05555678901'},
    {'name': 'Lale', 'surname': 'Doğan', 'birthDate': '12/02/1994', 'phone': '05556790123'},
    {'name': 'Ozan', 'surname': 'Uçar', 'birthDate': '25/05/1982', 'phone': '05557890123'},
    {'name': 'Aylin', 'surname': 'Aksoy', 'birthDate': '08/10/1999', 'phone': '05558901234'},
    {'name': 'Tuna', 'surname': 'Boz', 'birthDate': '15/07/1985', 'phone': '05559012345'},
    {'name': 'Nisan', 'surname': 'Çınar', 'birthDate': '20/03/1992', 'phone': '05550123456'},
    {'name': 'Barış', 'surname': 'Erdem', 'birthDate': '07/06/1988', 'phone': '05551234569'},
    {'name': 'Ece', 'surname': 'Fidan', 'birthDate': '11/09/1995', 'phone': '05559876545'},
    {'name': 'Caner', 'surname': 'Gök', 'birthDate': '03/12/1983', 'phone': '05554321989'},
    {'name': 'Ipek', 'surname': 'Hançer', 'birthDate': '27/04/1997', 'phone': '05557654323'},
    {'name': 'Umut', 'surname': 'İpek', 'birthDate': '16/01/1990', 'phone': '05556789014'},
    {'name': 'Beren', 'surname': 'Jale', 'birthDate': '22/08/1986', 'phone': '05552345680'},
    {'name': 'Deniz', 'surname': 'Kara', 'birthDate': '14/03/1994', 'phone': '05553456791'},
    {'name': 'Ferit', 'surname': 'Lale', 'birthDate': '09/06/1989', 'phone': '05554567891'},
    {'name': 'Gizem', 'surname': 'Mavi', 'birthDate': '30/11/1996', 'phone': '05555678902'},
    {'name': 'Hakan', 'surname': 'Naz', 'birthDate': '05/02/1985', 'phone': '05556790124'},
    {'name': 'İrem', 'surname': 'Okyay', 'birthDate': '18/07/1993', 'phone': '05557890124'},
    {'name': 'Jülide', 'surname': 'Poyraz', 'birthDate': '25/04/1987', 'phone': '05558901235'},
    {'name': 'Kemal', 'surname': 'Rüzgar', 'birthDate': '12/09/1998', 'phone': '05559012346'},
    {'name': 'Leyla', 'surname': 'Sarp', 'birthDate': '08/01/1984', 'phone': '05550123457'},
    {'name': 'Mert', 'surname': 'Taş', 'birthDate': '15/10/1991', 'phone': '05551234570'},
    {'name': 'Nur', 'surname': 'Uğur', 'birthDate': '20/05/1986', 'phone': '05559876546'},
    {'name': 'Onur', 'surname': 'Vural', 'birthDate': '03/08/1995', 'phone': '05554321990'},
    {'name': 'Pınar', 'surname': 'Yalçın', 'birthDate': '27/02/1989', 'phone': '05557654324'},
    {'name': 'Rıza', 'surname': 'Zeybek', 'birthDate': '16/11/1997', 'phone': '05556789015'},
    {'name': 'Sema', 'surname': 'Atay', 'birthDate': '22/06/1983', 'phone': '05552345681'},
    {'name': 'Tolga', 'surname': 'Bolat', 'birthDate': '14/09/1990', 'phone': '05553456792'},
    {'name': 'Ümit', 'surname': 'Çelik', 'birthDate': '09/03/1988', 'phone': '05554567892'},
    {'name': 'Vildan', 'surname': 'Demir', 'birthDate': '30/12/1996', 'phone': '05555678903'},
    {'name': 'Yağmur', 'surname': 'Efe', 'birthDate': '05/07/1985', 'phone': '05556790125'},
    {'name': 'Zeki', 'surname': 'Fırat', 'birthDate': '18/04/1993', 'phone': '05557890125'},
    {'name': 'Aslı', 'surname': 'Göz', 'birthDate': '25/01/1987', 'phone': '05558901236'},
    {'name': 'Bülent', 'surname': 'Hız', 'birthDate': '12/06/1998', 'phone': '05559012347'},
    {'name': 'Ceren', 'surname': 'İnan', 'birthDate': '08/09/1984', 'phone': '05550123458'},
    {'name': 'Duygu', 'surname': 'Kaya', 'birthDate': '15/02/1991', 'phone': '05551234571'},
    {'name': 'Emir', 'surname': 'Lütfi', 'birthDate': '20/08/1986', 'phone': '05559876547'},
    {'name': 'Fatih', 'surname': 'Murat', 'birthDate': '03/05/1995', 'phone': '05554321991'},
    {'name': 'Gökhan', 'surname': 'Nehir', 'birthDate': '27/10/1989', 'phone': '05557654325'},
    {'name': 'Hale', 'surname': 'Öz', 'birthDate': '16/03/1997', 'phone': '05556789016'},
    {'name': 'İdil', 'surname': 'Pek', 'birthDate': '22/07/1983', 'phone': '05552345682'},
    {'name': 'Jale', 'surname': 'Quş', 'birthDate': '14/11/1990', 'phone': '05553456793'},
    {'name': 'Kıvanç', 'surname': 'Rana', 'birthDate': '09/04/1988', 'phone': '05554567893'},
    {'name': 'Lütfiye', 'surname': 'Sönmez', 'birthDate': '30/06/1996', 'phone': '05555678904'},
    {'name': 'Melis', 'surname': 'Turan', 'birthDate': '05/09/1985', 'phone': '05556790126'},
    {'name': 'Nihat', 'surname': 'Ünal', 'birthDate': '18/12/1993', 'phone': '05557890126'},
    {'name': 'Oğuz', 'surname': 'Varol', 'birthDate': '25/03/1987', 'phone': '05558901237'},
    {'name': 'Pelin', 'surname': 'Yılmaz', 'birthDate': '12/08/1998', 'phone': '05559012348'},
    {'name': 'Recep', 'surname': 'Zengin', 'birthDate': '08/01/1984', 'phone': '05550123459'},
    {'name': 'Serhat', 'surname': 'Acar', 'birthDate': '15/05/1991', 'phone': '05551234572'},
    {'name': 'Tuğçe', 'surname': 'Berk', 'birthDate': '20/10/1986', 'phone': '05559876548'},
    {'name': 'Ulaş', 'surname': 'Cengiz', 'birthDate': '03/07/1995', 'phone': '05554321992'},
    {'name': 'Veysel', 'surname': 'Duman', 'birthDate': '27/02/1989', 'phone': '05557654326'},
    {'name': 'Yasemin', 'surname': 'Ekinci', 'birthDate': '16/09/1997', 'phone': '05556789017'},
    {'name': 'Zerrin', 'surname': 'Fener', 'birthDate': '22/04/1983', 'phone': '05552345683'},
    {'name': 'Adem', 'surname': 'Gül', 'birthDate': '14/06/1990', 'phone': '05553456794'},
    {'name': 'Belgin', 'surname': 'Hacılar', 'birthDate': '09/11/1988', 'phone': '05554567894'},
    {'name': 'Cavit', 'surname': 'İmre', 'birthDate': '30/03/1996', 'phone': '05555678905'},
    {'name': 'Derya', 'surname': 'Kocatepe', 'birthDate': '05/08/1985', 'phone': '05556790127'},
    {'name': 'Ersin', 'surname': 'Lodos', 'birthDate': '18/01/1993', 'phone': '05557890127'},
    {'name': 'Funda', 'surname': 'Menderes', 'birthDate': '25/07/1987', 'phone': '05558901238'},
    {'name': 'Gülden', 'surname': 'Nalbant', 'birthDate': '12/10/1998', 'phone': '05559012349'},
    {'name': 'Halil', 'surname': 'Özkan', 'birthDate': '08/04/1984', 'phone': '05550123460'},
    {'name': 'İsmet', 'surname': 'Pazar', 'birthDate': '15/09/1991', 'phone': '05551234573'},
    {'name': 'Jehan', 'surname': 'Rıfat', 'birthDate': '20/02/1986', 'phone': '05559876549'},
    {'name': 'Kader', 'surname': 'Saka', 'birthDate': '03/06/1995', 'phone': '05554321993'},
    {'name': 'Levent', 'surname': 'Tamer', 'birthDate': '27/11/1989', 'phone': '05557654327'},
    {'name': 'Merve', 'surname': 'Uğur', 'birthDate': '16/05/1997', 'phone': '05556789018'},
    {'name': 'Nazlı', 'surname': 'Veli', 'birthDate': '22/08/1983', 'phone': '05552345684'},
    {'name': 'Orhan', 'surname': 'Yıldırım', 'birthDate': '14/12/1990', 'phone': '05553456795'},
    {'name': 'Poyraz', 'surname': 'Zorlu', 'birthDate': '09/07/1988', 'phone': '05554567895'},
    {'name': 'Rüya', 'surname': 'Akyol', 'birthDate': '30/10/1996', 'phone': '05555678906'},
    {'name': 'Sarp', 'surname': 'Balkan', 'birthDate': '05/03/1985', 'phone': '05556790128'},
    {'name': 'Tamer', 'surname': 'Çelik', 'birthDate': '18/06/1993', 'phone': '05557890128'},
    {'name': 'Utku', 'surname': 'Duru', 'birthDate': '25/09/1987', 'phone': '05558901239'},
    {'name': 'Volkan', 'surname': 'Ertuğ', 'birthDate': '12/02/1998', 'phone': '05559012350'},
    {'name': 'Yavuz', 'surname': 'Fidan', 'birthDate': '08/05/1984', 'phone': '05550123461'},
    {'name': 'Zehra', 'surname': 'Göztepe', 'birthDate': '15/08/1991', 'phone': '05551234574'},
    {'name': 'Alper', 'surname': 'Hızlı', 'birthDate': '20/01/1986', 'phone': '05559876550'},
    {'name': 'Bahar', 'surname': 'İnce', 'birthDate': '03/04/1995', 'phone': '05554321994'},
    {'name': 'Cihan', 'surname': 'Jale', 'birthDate': '27/07/1989', 'phone': '05557654328'},
    {'name': 'Dilara', 'surname': 'Kara', 'birthDate': '16/11/1997', 'phone': '05556789019'},
    {'name': 'Enes', 'surname': 'Lale', 'birthDate': '22/03/1983', 'phone': '05552345685'},
    {'name': 'Feriha', 'surname': 'Mavi', 'birthDate': '14/06/1990', 'phone': '05553456796'},
    {'name': 'Gamze', 'surname': 'Naz', 'birthDate': '09/09/1988', 'phone': '05554567896'},
    {'name': 'Hüseyin', 'surname': 'Okyay', 'birthDate': '30/12/1996', 'phone': '05555678907'},
    {'name': 'İlker', 'surname': 'Poyraz', 'birthDate': '05/02/1985', 'phone': '05556790129'},
    {'name': 'Jale', 'surname': 'Rüzgar', 'birthDate': '18/05/1993', 'phone': '05557890129'},
    {'name': 'Kerem', 'surname': 'Sarp', 'birthDate': '25/08/1987', 'phone': '05558901240'},
    {'name': 'Lale', 'surname': 'Taş', 'birthDate': '12/11/1998', 'phone': '05559012351'},
    {'name': 'Mehmet', 'surname': 'Uğur', 'birthDate': '08/03/1984', 'phone': '05550123462'},
    {'name': 'Nermin', 'surname': 'Vural', 'birthDate': '15/06/1991', 'phone': '05551234575'},
    {'name': 'Oktay', 'surname': 'Yalçın', 'birthDate': '20/09/1986', 'phone': '05559876551'},
    {'name': 'Pervin', 'surname': 'Zeybek', 'birthDate': '03/12/1995', 'phone': '05554321995'},
    {'name': 'Rabia', 'surname': 'Atay', 'birthDate': '27/04/1989', 'phone': '05557654329'},
    {'name': 'Sercan', 'surname': 'Bolat', 'birthDate': '16/07/1997', 'phone': '05556789020'},
    {'name': 'Tülay', 'surname': 'Çelik', 'birthDate': '22/10/1983', 'phone': '05552345686'},
    {'name': 'Uğur', 'surname': 'Demir', 'birthDate': '14/01/1990', 'phone': '05553456797'},
    {'name': 'Veli', 'surname': 'Efe', 'birthDate': '09/05/1988', 'phone': '05554567897'},
    {'name': 'Yıldız', 'surname': 'Fırat', 'birthDate': '30/08/1996', 'phone': '05555678908'},
    {'name': 'Zeynel', 'surname': 'Göz', 'birthDate': '05/11/1985', 'phone': '05556790130'},
    {'name': 'Arda', 'surname': 'Hız', 'birthDate': '18/02/1993', 'phone': '05557890130'},
    {'name': 'Banu', 'surname': 'İnan', 'birthDate': '25/07/1987', 'phone': '05558901241'},
    {'name': 'Can', 'surname': 'Kaya', 'birthDate': '12/10/1998', 'phone': '05559012352'},
    {'name': 'Demet', 'surname': 'Lütfi', 'birthDate': '08/04/1984', 'phone': '05550123463'},
    {'name': 'Ege', 'surname': 'Murat', 'birthDate': '15/09/1991', 'phone': '05551234576'},
    {'name': 'Figen', 'surname': 'Nehir', 'birthDate': '20/12/1986', 'phone': '05559876552'},
    {'name': 'Güney', 'surname': 'Öz', 'birthDate': '03/03/1995', 'phone': '05554321996'},
    {'name': 'Hande', 'surname': 'Pek', 'birthDate': '27/06/1989', 'phone': '05557654330'},
    {'name': 'İnci', 'surname': 'Quş', 'birthDate': '16/09/1997', 'phone': '05556789021'},
    {'name': 'Jülide', 'surname': 'Rana', 'birthDate': '22/02/1983', 'phone': '05552345687'},
    {'name': 'Kutlu', 'surname': 'Sönmez', 'birthDate': '14/05/1990', 'phone': '05553456798'},
    {'name': 'Lina', 'surname': 'Turan', 'birthDate': '09/08/1988', 'phone': '05554567898'},
    {'name': 'Murat', 'surname': 'Ünal', 'birthDate': '30/11/1996', 'phone': '05555678909'},
    {'name': 'Nazan', 'surname': 'Varol', 'birthDate': '05/04/1985', 'phone': '05556790131'},
    {'name': 'Olcay', 'surname': 'Yılmaz', 'birthDate': '18/07/1993', 'phone': '05557890131'},
    {'name': 'Polat', 'surname': 'Zengin', 'birthDate': '25/10/1987', 'phone': '05558901242'},
    {'name': 'Ruken', 'surname': 'Acar', 'birthDate': '12/03/1998', 'phone': '05559012353'},
    {'name': 'Safa', 'surname': 'Berk', 'birthDate': '08/06/1984', 'phone': '05550123464'},
    {'name': 'Tarık', 'surname': 'Cengiz', 'birthDate': '15/09/1991', 'phone': '05551234577'},
    {'name': 'Ülkü', 'surname': 'Duman', 'birthDate': '20/12/1986', 'phone': '05559876553'},
    {'name': 'Vahap', 'surname': 'Ekinci', 'birthDate': '03/05/1995', 'phone': '05554321997'},
    {'name': 'Yaren', 'surname': 'Fener', 'birthDate': '27/08/1989', 'phone': '05557654331'},
    {'name': 'Ziya', 'surname': 'Gül', 'birthDate': '16/11/1997', 'phone': '05556789022'},
  ];
  Future<void> _makePhoneCall(String phoneNumber) async {
    try {
      debugPrint("Orijinal Numara: $phoneNumber");
      String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
      debugPrint("Temizlenmiş Numara: $cleanedNumber");
      if (cleanedNumber.isEmpty) {
        throw Exception("Numara boş veya geçersiz.");
      }
      if (cleanedNumber.startsWith('0')) {
        cleanedNumber = '+90${cleanedNumber.substring(1)}';
        debugPrint("Formatlandı (0 ile başlıyordu): $cleanedNumber");
      } else if (!cleanedNumber.startsWith('+')) {
        cleanedNumber = '+90$cleanedNumber';
        debugPrint("Formatlandı (+ yoktu): $cleanedNumber");
      }
      final Uri launchUri = Uri(scheme: 'tel', path: cleanedNumber);
      debugPrint("Arama URI: $launchUri");
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
        debugPrint("Arama başlatıldı: $cleanedNumber");
      } else {
        throw Exception("Arama başlatılamadı. URI: $launchUri");
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hata oluştu: $e')));
        debugPrint("Hata: $e");
      }
    }
  }

  void _addNewContact() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController surnameController = TextEditingController();
    final TextEditingController birthDateController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          title: Text('Yeni Kişi Ekle', style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.w500)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Bootstrap.person, color: AppColors.borderColor),
                    labelText: 'Adı',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Bootstrap.person, color: AppColors.borderColor),
                    labelText: 'Soyadı',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: birthDateController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Bootstrap.calendar, color: AppColors.borderColor),
                    labelText: 'D.Tarihi (GG/AA/YYYY)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Bootstrap.phone, color: AppColors.borderColor),
                    labelText: 'Cep Telefonu',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.greenSpot),
              onPressed: () => Navigator.pop(context),
              child: Text("İptal", style: TextStyle(color: AppColors.whiteSpot)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.snackBarGreen),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    surnameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  setState(() {
                    contacts.add({
                      'name': nameController.text,
                      'surname': surnameController.text,
                      'birthDate': birthDateController.text,
                      'phone': phoneController.text,
                    });
                  });
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Lütfen tüm alanları doldurun!')));
                }
              },
              child: const Text('Ekle', style: TextStyle(color: AppColors.whiteSpot)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidgets(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 2,
          children: [
            phoneSearchBar(controller: _controller),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    tileColor: AppColors.customCardColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.customCardColor,
                      child: Icon(FeatherIcons.user, color: AppColors.borderColor, size: 30),
                    ),
                    title: Text('${contact['name']} ${contact['surname']}'),
                    subtitle: Text('Doğum Tarihi: ${contact['birthDate']}\nTelefon: ${contact['phone']}'),
                    trailing: IconButton(
                      icon: const Icon(FeatherIcons.phoneCall, color: AppColors.snackBarGreen, size: 30),
                      onPressed: () => _makePhoneCall(contact['phone']!),
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: _addNewContact,
              backgroundColor: AppColors.snackBarGreen,
              child: const Icon(FeatherIcons.userPlus, color: AppColors.scaffoldBackgroundColor),
            ),
          ],
        ),
      ),
    );
  }
}

class phoneSearchBar extends StatelessWidget {
  const phoneSearchBar({super.key, required TextEditingController controller}) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.lighten,
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.searcColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(FeatherIcons.search, color: AppColors.borderColor),
          suffixIcon: Icon(Bootstrap.filter_right, color: AppColors.borderColor),
          hintText: 'Telefon Ara...',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}
