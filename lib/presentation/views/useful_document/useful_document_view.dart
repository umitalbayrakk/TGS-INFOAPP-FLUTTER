import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class UsefulDocumentView extends StatefulWidget {
  final Map<String, String>? user;
  const UsefulDocumentView({super.key, this.user});

  @override
  State<UsefulDocumentView> createState() => _UsefulDocumentViewState();
}

class _UsefulDocumentViewState extends State<UsefulDocumentView> {
  final List<Map<String, String>> documents = [
    {
        "title": "İzin Dilekçesi",
        "url": "https://example.com/tgs_permission.pdf",
        "description": "TGS Yer Hizmetleri A.Ş. için izin dilekçesi örneği.",
        "content": """
         TGS Yer Hizmetleri A.Ş. İnsan Kaynakları Müdürlüğüne

          Şirketiniz bünyesinde ... Departmanında ... pozisyonunda çalışmaktayım. 
          ... tarihleri arasında ... nedeniyle izinli sayılmamı arz ederim.

          Gereğini arz ederim.

          .../.../...
          
          Ad Soyad 
          İmza
          Personel No:
          
        """,
      },
    {
      "title": "İzin Talep Formu",
      "url": "https://example.com/tgs_leave_request.pdf",
      "description": "TGS Yer Hizmetleri A.Ş. resmi izin talep formu.",
      "content": """
        TGS YER HİZMETLERİ A.Ş. İZİN TALEP FORMU
        
        Personel Adı Soyadı: 
        Personel No:
        Departman:
        Pozisyon:
        İzin Türü: (Yıllık, Ücretsiz, Hastalık, Diğer)
        İzin Başlangıç Tarihi:
        İzin Bitiş Tarihi:
        Toplam İzin Günü:
        İzin Nedeni:
        
        Onaylayan Müdür:
        İmza:
        Tarih:
        İnsan Kaynakları Onayı:
        İmza:
        Tarih:
      """,
    },
    {
      "title": "Sağlık Raporu Şablonu",
      "url": "https://example.com/tgs_health_report.pdf",
      "description": "TGS Yer Hizmetleri A.Ş. için sağlık raporu şablonu.",
      "content": """
        TGS YER HİZMETLERİ A.Ş. SAĞLIK RAPORU
        
        Personelin Adı Soyadı:
        TC Kimlik No:
        Personel No:
        Doğum Tarihi:
        
        Muayene Bulguları:
        Teşhis:
        Önerilen Tedavi:
        İstirahat Süresi: ... gün
        
        Raportör Doktor:
        Adı Soyadı:
        İmza:
        Tarih:
        Hastane/Muayenehane Mühürü
        TGS Yer Hizmetleri A.Ş. Onay Mührü
      """,
    },
    {
      "title": "Görevlendirme Belgesi",
      "url": "https://example.com/tgs_assignment_doc.pdf",
      "description": "TGS Yer Hizmetleri A.Ş. için görevlendirme belgesi.",
      "content": """
        TGS YER HİZMETLERİ A.Ş. GÖREVLENDİRME BELGESİ
        
        Personel Adı Soyadı:
        Personel No:
        Görevi:
        Görevlendirildiği Birim/Departman:
        Görevlendirme Nedeni:
        Görev Başlangıç Tarihi:
        Görev Bitiş Tarihi:
        Görev Yeri:
        
        Onaylayan Müdür:
        Ünvan:
        İmza:
        Tarih:
        TGS Yer Hizmetleri A.Ş. Mührü
      """,
    },
    {
      "title": "Seyahat İzin Belgesi",
      "url": "https://example.com/tgs_travel_permit.pdf",
      "description": "TGS Yer Hizmetleri A.Ş. için seyahat izni belgesi.",
      "content": """
        TGS YER HİZMETLERİ A.Ş. SEYAHAT İZİN BELGESİ
        
        Adı Soyadı:
        TC Kimlik No:
        Personel No:
        Departman:
        Görevi:
        Seyahat Nedeni:
        Gidilecek Yer:
        Seyahat Başlangıç Tarihi:
        Seyahat Bitiş Tarihi:
        Konaklama Bilgileri:
        Ulaşım Bilgileri:
        
        Onaylayan Müdür:
        Ünvan:
        İmza:
        Tarih:
        TGS Yer Hizmetleri A.Ş. Mührü
      """,
    },
    {
      "title": "Fazla Mesai Formu",
      "url": "https://example.com/tgs_overtime_form.pdf",
      "description": "TGS Yer Hizmetleri A.Ş. fazla mesai bildirim formu.",
      "content": """
        TGS YER HİZMETLERİ A.Ş. FAZLA MESAİ BİLDİRİM FORMU
        
        Personel Adı Soyadı:
        Personel No:
        Departman:
        Pozisyon:
        Mesai Tarihi:
        Mesai Başlangıç Saati:
        Mesai Bitiş Saati:
        Toplam Mesai Süresi:
        Mesai Nedeni:
        Yapılan İşin Açıklaması:
        
        Onaylayan Müdür:
        İmza:
        Tarih:
        
        İnsan Kaynakları Onayı:
        İmza:
        Tarih:
        TGS Yer Hizmetleri A.Ş. Mührü
      """,
    },
  ];

  void _downloadDocument(String url) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("'$url' indiriliyor...", style: TextStyle(color: AppColors.borderColor)),
        backgroundColor: AppColors.snackBarGreen,
      ),
    );
  }

  void _navigateToDetailPage(Map<String, String> document) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DocumentDetailPage(document: document)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "TGS Yer Hizmetleri A.Ş. Faydalı Dokümanlar",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.borderColor),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final doc = documents[index];
                return ListTile(
                  leading: const Icon(FeatherIcons.fileMinus, color: AppColors.borderColor),
                  title: Text(doc["title"]!, style: const TextStyle(fontSize: 18)),
                  subtitle: Text(doc["description"]!, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  onTap: () => _navigateToDetailPage(doc),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      IconButton(
                        icon: const Icon(FeatherIcons.download, color: AppColors.borderColor),
                        onPressed: () => _downloadDocument(doc["url"]!),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentDetailPage extends StatelessWidget {
  final Map<String, String> document;

  const DocumentDetailPage({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(title: Text(document["title"]!), backgroundColor: AppColors.customCardColor),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(document["title"]!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(document["description"]!, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 24),
            Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(document["content"]!, style: const TextStyle(fontSize: 16, height: 1.5)),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Bootstrap.download, color: Colors.white),
                  label: const Text("İndir", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${document["title"]} indiriliyor..."),
                        backgroundColor: AppColors.snackBarGreen,
                      ),
                    );
                    _launchUrl(context, document["url"]!);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.snackBarGreen),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Belge açılamadı!"), backgroundColor: Colors.red));
    }
  }
}
