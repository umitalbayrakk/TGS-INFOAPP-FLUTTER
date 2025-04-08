import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:tgs_info_app_flutter/utils/constant.dart';

class BornTodayScreen extends StatefulWidget {
  @override
  State<BornTodayScreen> createState() => _BornTodayScreenState();
}

class _BornTodayScreenState extends State<BornTodayScreen> {
  final List<Map<String, String>> users = [
    {
      "name": "Ahmet Yılmaz",
      "birthDate": "5 Nisan 1985",
      "bio": "Türk mühendis ve girişimci.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Zeynep Demir",
      "birthDate": "23 Nisan 1990",
      "bio": "Ünlü Türk yazar ve akademisyen.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Mehmet Kaya",
      "birthDate": "7 Temmuz 1978",
      "bio": "Başarılı bir iş insanı ve mentor.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Elif Çelik",
      "birthDate": "10 Ocak 1995",
      "bio": "Sanatçı ve moda tasarımcısı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Burak Şahin",
      "birthDate": "7 Nisan 1982",
      "bio": "Film yapımcısı ve yönetmen.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Merve Arslan",
      "birthDate": "30 Haziran 1988",
      "bio": "Başarılı bir akademisyen ve araştırmacı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Caner Özkan",
      "birthDate": "8 Nisan 1993",
      "bio": "Profesyonel sporcu ve antrenör.",
      "imageUrl": "assets/svg/women.svg",
    },
    {
      "name": "Ebru Taş",
      "birthDate": "18 Kasım 1980",
      "bio": "Müzik sanatçısı ve besteci.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Emre Karaca",
      "birthDate": "25 Eylül 1986",
      "bio": "Girişimci ve teknoloji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Selin Güneş",
      "birthDate": "8 Ağustos 1992",
      "bio": "Gazeteci ve televizyon sunucusu.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Ali Çetin",
      "birthDate": "15 Mart 1984",
      "bio": "Yazılım geliştiricisi ve inovatör.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Fatma Yılmazer",
      "birthDate": "20 Mayıs 1991",
      "bio": "Eğitimci ve sosyal girişimci.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Hakan Demirci",
      "birthDate": "3 Ekim 1979",
      "bio": "Finans uzmanı ve danışman.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Ayşe Koca",
      "birthDate": "12 Aralık 1987",
      "bio": "Tasarımcı ve sanat yönetmeni.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Mustafa Erdem",
      "birthDate": "9 Şubat 1994",
      "bio": "Mühendis ve proje yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Gülay Şimşek",
      "birthDate": "22 Temmuz 1983",
      "bio": "Psikolog ve yazar.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Oğuzhan Yılmaz",
      "birthDate": "14 Haziran 1990",
      "bio": "Pazarlama uzmanı ve lider.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Nazlı Kaya",
      "birthDate": "27 Nisan 1981",
      "bio": "Mimar ve çevre aktivisti.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Serkan Aydın",
      "birthDate": "11 Ağustos 1989",
      "bio": "Veri analisti ve strateji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Derya Öz",
      "birthDate": "19 Ocak 1996",
      "bio": "Dijital pazarlama uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Kerem Türker",
      "birthDate": "6 Mart 1985",
      "bio": "Yönetim danışmanı ve eğitmen.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Buse Yılmaz",
      "birthDate": "28 Eylül 1993",
      "bio": "Grafik tasarımcı ve illüstratör.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "İsmail Güler",
      "birthDate": "4 Kasım 1982",
      "bio": "Lojistik uzmanı ve girişimci.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Ceren Aksoy",
      "birthDate": "17 Mayıs 1991",
      "bio": "İç mimar ve dekorasyon uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Tolga Erkan",
      "birthDate": "30 Ekim 1980",
      "bio": "Yazılım mimarı ve teknoloji lideri.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Zehra Çelik",
      "birthDate": "2 Şubat 1992",
      "bio": "Eğitim teknolojileri uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Barış Yılmaz",
      "birthDate": "25 Aralık 1986",
      "bio": "Müzik prodüktörü ve DJ.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Sude Kaya",
      "birthDate": "13 Mart 1995",
      "bio": "Moda blog yazarı ve influencer.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Eren Şahin",
      "birthDate": "9 Haziran 1984",
      "bio": "Otomotiv mühendisi ve inovatör.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Aylin Demir",
      "birthDate": "21 Temmuz 1990",
      "bio": "Hukuk danışmanı ve avukat.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Yavuz Öztürk",
      "birthDate": "16 Nisan 1983",
      "bio": "Girişimci ve yatırımcı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Esra Yılmaz",
      "birthDate": "8 Eylül 1994",
      "bio": "Diyetisyen ve sağlık koçu.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Onur Kaya",
      "birthDate": "14 Şubat 1987",
      "bio": "Reklamcı ve yaratıcı yönetmen.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Gamze Çelik",
      "birthDate": "3 Ağustos 1991",
      "bio": "Sosyal medya yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Umut Arslan",
      "birthDate": "26 Mayıs 1980",
      "bio": "Emlak geliştirme uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Lale Şimşek",
      "birthDate": "19 Ekim 1993",
      "bio": "İnsan kaynakları uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Kadir Yılmaz",
      "birthDate": "7 Ocak 1989",
      "bio": "Yazılım test uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "İpek Kaya",
      "birthDate": "22 Mart 1985",
      "bio": "Çevre mühendisi ve aktivist.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Taner Demir",
      "birthDate": "15 Kasım 1992",
      "bio": "Spor koçu ve fitness uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Nihal Öz",
      "birthDate": "11 Eylül 1981",
      "bio": "Eğitim danışmanı ve yazar.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Alper Taş",
      "birthDate": "28 Şubat 1990",
      "bio": "Oyun geliştiricisi ve tasarımcı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Berrin Yılmaz",
      "birthDate": "4 Aralık 1988",
      "bio": "Pazarlama analisti.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Cihan Kaya",
      "birthDate": "17 Temmuz 1984",
      "bio": "Finans müdürü ve strateji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Ece Demir",
      "birthDate": "30 Ocak 1995",
      "bio": "Sosyal girişimci ve lider.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Ferhat Arslan",
      "birthDate": "23 Haziran 1982",
      "bio": "Mühendislik danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Hande Çelik",
      "birthDate": "6 Nisan 1991",
      "bio": "Dijital içerik üreticisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "İbrahim Yılmaz",
      "birthDate": "12 Ağustos 1980",
      "bio": "Lojistik yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Jale Kaya",
      "birthDate": "19 Mart 1993",
      "bio": "Eğitim teknolojisi uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Kemal Demir",
      "birthDate": "25 Ekim 1986",
      "bio": "Yazılım mimarı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Leyla Öz",
      "birthDate": "9 Şubat 1992",
      "bio": "Moda tasarımcısı ve stilist.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Murat Şahin",
      "birthDate": "14 Mayıs 1985",
      "bio": "Girişimci ve teknoloji lideri.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Nurcan Yılmaz",
      "birthDate": "20 Temmuz 1990",
      "bio": "Psikolojik danışman.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Orhan Kaya",
      "birthDate": "3 Nisan 1983",
      "bio": "İnşaat mühendisi ve proje yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Pınar Demir",
      "birthDate": "16 Haziran 1994",
      "bio": "Diyetisyen ve beslenme uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Rıza Arslan",
      "birthDate": "27 Eylül 1981",
      "bio": "Finans analisti.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Sinem Çelik",
      "birthDate": "8 Aralık 1989",
      "bio": "Dijital pazarlama uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Tayfun Yılmaz",
      "birthDate": "22 Ocak 1995",
      "bio": "Yazılım geliştiricisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Ümit Kaya",
      "birthDate": "5 Mart 1987",
      "bio": "Emlak yatırımcısı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Veli Demir",
      "birthDate": "18 Mayıs 1992",
      "bio": "Mühendislik danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Yasemin Öz",
      "birthDate": "11 Temmuz 1984",
      "bio": "Hukuk danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Zafer Şahin",
      "birthDate": "29 Ağustos 1990",
      "bio": "Spor yöneticisi ve koçu.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Aybüke Yılmaz",
      "birthDate": "13 Ekim 1986",
      "bio": "Eğitimci ve yazar.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Burcu Kaya",
      "birthDate": "1 Şubat 1993",
      "bio": "Moda editörü.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Cemil Demir",
      "birthDate": "24 Nisan 1980",
      "bio": "Yönetim danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Defne Arslan",
      "birthDate": "17 Haziran 1991",
      "bio": "Dijital içerik üreticisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Engin Çelik",
      "birthDate": "30 Temmuz 1985",
      "bio": "Teknoloji girişimcisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Figen Yılmaz",
      "birthDate": "9 Eylül 1992",
      "bio": "Psikolog ve terapist.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Gökhan Kaya",
      "birthDate": "22 Kasım 1988",
      "bio": "Finans uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Hale Demir",
      "birthDate": "15 Mart 1983",
      "bio": "Eğitim teknoloji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "İlker Arslan",
      "birthDate": "28 Ocak 1994",
      "bio": "Yazılım mühendisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Jülide Çelik",
      "birthDate": "4 Mayıs 1987",
      "bio": "Moda tasarımcısı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Kaan Yılmaz",
      "birthDate": "19 Haziran 1990",
      "bio": "Girişimci ve lider.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Lütfi Kaya",
      "birthDate": "12 Ağustos 1982",
      "bio": "Lojistik uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Melis Demir",
      "birthDate": "25 Eylül 1995",
      "bio": "Dijital pazarlama uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Necip Arslan",
      "birthDate": "8 Ekim 1981",
      "bio": "Mühendislik danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Özlem Çelik",
      "birthDate": "21 Aralık 1989",
      "bio": "Eğitim danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Ramazan Yılmaz",
      "birthDate": "3 Şubat 1993",
      "bio": "Yazılım geliştiricisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Sevgi Kaya",
      "birthDate": "16 Nisan 1986",
      "bio": "Sosyal medya yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Tahir Demir",
      "birthDate": "29 Haziran 1991",
      "bio": "Finans analisti.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Ülkü Arslan",
      "birthDate": "11 Ağustos 1984",
      "bio": "Hukuk danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Volkan Çelik",
      "birthDate": "24 Ekim 1990",
      "bio": "Spor koçu.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Yıldız Yılmaz",
      "birthDate": "7 Aralık 1985",
      "bio": "Eğitimci ve yazar.",
      "imageUrl": "assets/images/placeholder.png",
    },
    {
      "name": "Zeki Kaya",
      "birthDate": "20 Mart 1992",
      "bio": "Teknoloji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Bugünün tarihini al (örn, "1 Ekim")
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
            imageUrl: todayUsers[0]["imageUrl"]!,
          )
        else
          Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.customCardColor),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.person, color: AppColors.borderColor, size: 30),
                SizedBox(width: 20),
                Text('Bu gün doğan herhangi bir kişi yok!'),
              ],
            ),
          ),
      ],
    );
  }

  List<Map<String, String>> _filterUsersByToday(List<Map<String, String>> users, String today) {
    return users.where((user) {
      String userDate = user["birthDate"]!.split(',')[0].trim();
      String userMonthDay = userDate.split(' ')[0] + ' ' + userDate.split(' ')[1].toLowerCase();
      return userMonthDay == today.split(' ')[0].toLowerCase() + ' ' + today.split(' ')[1];
    }).toList();
  }
}

class BornTodayCard extends StatelessWidget {
  final String name;
  final String birthDate;
  final String bio;
  final String imageUrl;

  const BornTodayCard({
    super.key,
    required this.name,
    required this.birthDate,
    required this.bio,
    required this.imageUrl,
  });

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
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  imageUrl,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: AppColors.borderColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(LineAwesome.birthday_cake_solid, color: AppColors.borderColor, size: 50),
                    );
                  },
                ),
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
