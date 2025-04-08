import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/navbar/custom_navbar_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<Map<String, String>> users = [
    {
      "name": "Ahmet Yılmaz",
      "birthDate": "2 Nisan 1985",
      "bio": "Türk mühendis ve girişimci.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Zeynep Demir",
      "birthDate": "23 Nisan 1990",
      "bio": "Ünlü Türk yazar ve akademisyen.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Mehmet Kaya",
      "birthDate": "7 Temmuz 1978",
      "bio": "Başarılı bir iş insanı ve mentor.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Elif Çelik",
      "birthDate": "10 Ocak 1995",
      "bio": "Sanatçı ve moda tasarımcısı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Burak Şahin",
      "birthDate": "5 Mayıs 1982",
      "bio": "Film yapımcısı ve yönetmen.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Merve Arslan",
      "birthDate": "30 Haziran 1988",
      "bio": "Başarılı bir akademisyen ve araştırmacı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Caner Özkan",
      "birthDate": "12 Şubat 1993",
      "bio": "Profesyonel sporcu ve antrenör.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ebru Taş",
      "birthDate": "18 Kasım 1980",
      "bio": "Müzik sanatçısı ve besteci.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Emre Karaca",
      "birthDate": "25 Eylül 1986",
      "bio": "Girişimci ve teknoloji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Selin Güneş",
      "birthDate": "8 Ağustos 1992",
      "bio": "Gazeteci ve televizyon sunucusu.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ali Çetin",
      "birthDate": "15 Mart 1984",
      "bio": "Yazılım geliştiricisi ve inovatör.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Fatma Yılmazer",
      "birthDate": "20 Mayıs 1991",
      "bio": "Eğitimci ve sosyal girişimci.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Hakan Demirci",
      "birthDate": "3 Ekim 1979",
      "bio": "Finans uzmanı ve danışman.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ayşe Koca",
      "birthDate": "12 Aralık 1987",
      "bio": "Tasarımcı ve sanat yönetmeni.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Mustafa Erdem",
      "birthDate": "9 Şubat 1994",
      "bio": "Mühendis ve proje yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Gülay Şimşek",
      "birthDate": "22 Temmuz 1983",
      "bio": "Psikolog ve yazar.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Oğuzhan Yılmaz",
      "birthDate": "14 Haziran 1990",
      "bio": "Pazarlama uzmanı ve lider.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Nazlı Kaya",
      "birthDate": "27 Nisan 1981",
      "bio": "Mimar ve çevre aktivisti.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Serkan Aydın",
      "birthDate": "11 Ağustos 1989",
      "bio": "Veri analisti ve strateji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Derya Öz",
      "birthDate": "19 Ocak 1996",
      "bio": "Dijital pazarlama uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Kerem Türker",
      "birthDate": "6 Mart 1985",
      "bio": "Yönetim danışmanı ve eğitmen.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Buse Yılmaz",
      "birthDate": "28 Eylül 1993",
      "bio": "Grafik tasarımcı ve illüstratör.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "İsmail Güler",
      "birthDate": "4 Kasım 1982",
      "bio": "Lojistik uzmanı ve girişimci.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ceren Aksoy",
      "birthDate": "17 Mayıs 1991",
      "bio": "İç mimar ve dekorasyon uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Tolga Erkan",
      "birthDate": "30 Ekim 1980",
      "bio": "Yazılım mimarı ve teknoloji lideri.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Zehra Çelik",
      "birthDate": "2 Şubat 1992",
      "bio": "Eğitim teknolojileri uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Barış Yılmaz",
      "birthDate": "25 Aralık 1986",
      "bio": "Müzik prodüktörü ve DJ.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Sude Kaya",
      "birthDate": "13 Mart 1995",
      "bio": "Moda blog yazarı ve influencer.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Eren Şahin",
      "birthDate": "9 Haziran 1984",
      "bio": "Otomotiv mühendisi ve inovatör.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Aylin Demir",
      "birthDate": "21 Temmuz 1990",
      "bio": "Hukuk danışmanı ve avukat.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Yavuz Öztürk",
      "birthDate": "16 Nisan 1983",
      "bio": "Girişimci ve yatırımcı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Esra Yılmaz",
      "birthDate": "8 Eylül 1994",
      "bio": "Diyetisyen ve sağlık koçu.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Onur Kaya",
      "birthDate": "14 Şubat 1987",
      "bio": "Reklamcı ve yaratıcı yönetmen.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Gamze Çelik",
      "birthDate": "3 Ağustos 1991",
      "bio": "Sosyal medya yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Umut Arslan",
      "birthDate": "26 Mayıs 1980",
      "bio": "Emlak geliştirme uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Lale Şimşek",
      "birthDate": "19 Ekim 1993",
      "bio": "İnsan kaynakları uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Kadir Yılmaz",
      "birthDate": "7 Ocak 1989",
      "bio": "Yazılım test uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "İpek Kaya",
      "birthDate": "22 Mart 1985",
      "bio": "Çevre mühendisi ve aktivist.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Taner Demir",
      "birthDate": "15 Kasım 1992",
      "bio": "Spor koçu ve fitness uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Nihal Öz",
      "birthDate": "11 Eylül 1981",
      "bio": "Eğitim danışmanı ve yazar.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Alper Taş",
      "birthDate": "28 Şubat 1990",
      "bio": "Oyun geliştiricisi ve tasarımcı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Berrin Yılmaz",
      "birthDate": "4 Aralık 1988",
      "bio": "Pazarlama analisti.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Cihan Kaya",
      "birthDate": "17 Temmuz 1984",
      "bio": "Finans müdürü ve strateji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ece Demir",
      "birthDate": "30 Ocak 1995",
      "bio": "Sosyal girişimci ve lider.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ferhat Arslan",
      "birthDate": "23 Haziran 1982",
      "bio": "Mühendislik danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Hande Çelik",
      "birthDate": "6 Nisan 1991",
      "bio": "Dijital içerik üreticisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "İbrahim Yılmaz",
      "birthDate": "12 Ağustos 1980",
      "bio": "Lojistik yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Jale Kaya",
      "birthDate": "19 Mart 1993",
      "bio": "Eğitim teknolojisi uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Kemal Demir",
      "birthDate": "25 Ekim 1986",
      "bio": "Yazılım mimarı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Leyla Öz",
      "birthDate": "9 Şubat 1992",
      "bio": "Moda tasarımcısı ve stilist.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Murat Şahin",
      "birthDate": "14 Mayıs 1985",
      "bio": "Girişimci ve teknoloji lideri.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Nurcan Yılmaz",
      "birthDate": "20 Temmuz 1990",
      "bio": "Psikolojik danışman.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Orhan Kaya",
      "birthDate": "3 Nisan 1983",
      "bio": "İnşaat mühendisi ve proje yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Pınar Demir",
      "birthDate": "16 Haziran 1994",
      "bio": "Diyetisyen ve beslenme uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Rıza Arslan",
      "birthDate": "27 Eylül 1981",
      "bio": "Finans analisti.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Sinem Çelik",
      "birthDate": "8 Aralık 1989",
      "bio": "Dijital pazarlama uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Tayfun Yılmaz",
      "birthDate": "22 Ocak 1995",
      "bio": "Yazılım geliştiricisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ümit Kaya",
      "birthDate": "5 Mart 1987",
      "bio": "Emlak yatırımcısı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Veli Demir",
      "birthDate": "18 Mayıs 1992",
      "bio": "Mühendislik danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Yasemin Öz",
      "birthDate": "11 Temmuz 1984",
      "bio": "Hukuk danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Zafer Şahin",
      "birthDate": "29 Ağustos 1990",
      "bio": "Spor yöneticisi ve koçu.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Aybüke Yılmaz",
      "birthDate": "13 Ekim 1986",
      "bio": "Eğitimci ve yazar.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Burcu Kaya",
      "birthDate": "1 Şubat 1993",
      "bio": "Moda editörü.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Cemil Demir",
      "birthDate": "24 Nisan 1980",
      "bio": "Yönetim danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Defne Arslan",
      "birthDate": "17 Haziran 1991",
      "bio": "Dijital içerik üreticisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Engin Çelik",
      "birthDate": "30 Temmuz 1985",
      "bio": "Teknoloji girişimcisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Figen Yılmaz",
      "birthDate": "9 Eylül 1992",
      "bio": "Psikolog ve terapist.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Gökhan Kaya",
      "birthDate": "22 Kasım 1988",
      "bio": "Finans uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Hale Demir",
      "birthDate": "15 Mart 1983",
      "bio": "Eğitim teknoloji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "İlker Arslan",
      "birthDate": "28 Ocak 1994",
      "bio": "Yazılım mühendisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Jülide Çelik",
      "birthDate": "4 Mayıs 1987",
      "bio": "Moda tasarımcısı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Kaan Yılmaz",
      "birthDate": "19 Haziran 1990",
      "bio": "Girişimci ve lider.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Lütfi Kaya",
      "birthDate": "12 Ağustos 1982",
      "bio": "Lojistik uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Melis Demir",
      "birthDate": "25 Eylül 1995",
      "bio": "Dijital pazarlama uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Necip Arslan",
      "birthDate": "8 Ekim 1981",
      "bio": "Mühendislik danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Özlem Çelik",
      "birthDate": "21 Aralık 1989",
      "bio": "Eğitim danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ramazan Yılmaz",
      "birthDate": "3 Şubat 1993",
      "bio": "Yazılım geliştiricisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Sevgi Kaya",
      "birthDate": "16 Nisan 1986",
      "bio": "Sosyal medya yöneticisi.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Tahir Demir",
      "birthDate": "29 Haziran 1991",
      "bio": "Finans analisti.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Ülkü Arslan",
      "birthDate": "11 Ağustos 1984",
      "bio": "Hukuk danışmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Volkan Çelik",
      "birthDate": "24 Ekim 1990",
      "bio": "Spor koçu.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Yıldız Yılmaz",
      "birthDate": "7 Aralık 1985",
      "bio": "Eğitimci ve yazar.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password123",
    },
    {
      "name": "Zeki Kaya",
      "birthDate": "20 Mart 1992",
      "bio": "Teknoloji uzmanı.",
      "imageUrl": "assets/images/placeholder.png",
      "password": "password456",
    },
  ];

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Kullanıcıyı bul ve şifreyi kontrol et
    bool isAuthenticated = false;
    for (var user in users) {
      if (user["name"] == username && user["password"] == password) {
        isAuthenticated = true;
        break;
      }
    }

    if (isAuthenticated) {
      // Giriş başarılı, BornTodayScreen'e yönlendirme yapabilirsin.
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomNavbarWidgets()));
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: AppColors.scaffoldBackgroundColor,
              title: Text("Hata", style: TextStyle(color: AppColors.greenSpot, fontWeight: FontWeight.bold)),
              content: Text("Kullanıcı adı veya şifre yanlış!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Tamam", style: TextStyle(color: AppColors.borderColor)),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.customCardColor, Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: AppColors.scaffoldBackgroundColor,
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Icon(FeatherIcons.logIn, color: AppColors.borderColor, size: 32),
                          SizedBox(width: 10),
                          Text(
                            "Giriş Yap",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.borderColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Kullanıcı Adı",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(FeatherIcons.user),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Şifre",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(FeatherIcons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.borderColor,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text("Giriş Yap", style: TextStyle(fontSize: 16, color: AppColors.whiteSpot)),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
