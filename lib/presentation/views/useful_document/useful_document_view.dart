import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class UsefulDocumentView extends StatefulWidget {
  const UsefulDocumentView({super.key});

  @override
  State<UsefulDocumentView> createState() => _UsefulDocumentViewState();
}

class _UsefulDocumentViewState extends State<UsefulDocumentView> {
  final List<Map<String, String>> documents = [
    {
      "title": "İzin Dilekçesi",
      "url": "https://example.com/permission.pdf",
      "description": "İzin dilekçesi örneği.",
      "content": """
       TGS YER Hizmetleri A.Ş Müdürlüğüne

        Fakülteniz ... Bölümü ... Anabilim Dalında ... numaralı öğrencisiyim. 
        ... tarihleri arasında ... nedeniyle izinli sayılmamı arz ederim.

        Gereğini arz ederim.

        .../.../...
        
        Ad Soyad
        İmza
      """,
    },
    {
      "title": "İzin Talep Formu",
      "url": "https://example.com/leave_request.pdf",
      "description": "Resmi izin talep formu.",
      "content": """
        İZİN TALEP FORMU
        
        Personel Adı Soyadı:
        Departman:
        İzin Türü: (Yıllık, Ücretsiz, Hastalık, Diğer)
        İzin Başlangıç Tarihi:
        İzin Bitiş Tarihi:
        Toplam İzin Günü:
        İzin Nedeni:
        
        Onaylayan:
        İmza:
        Tarih:
      """,
    },
    {
      "title": "Sağlık Raporu Şablonu",
      "url": "https://example.com/health_report.pdf",
      "description": "Sağlık raporu için örnek şablon.",
      "content": """
        SAĞLIK RAPORU
        
        Hastanın Adı Soyadı:
        TC Kimlik No:
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
      """,
    },
    {
      "title": "Görevlendirme Belgesi",
      "url": "https://example.com/assignment_doc.pdf",
      "description": "Görevlendirme için resmi belge.",
      "content": """
        GÖREVLENDİRME BELGESİ
        
        Personel Adı Soyadı:
        Görevi:
        Görevlendirildiği Birim:
        Görevlendirme Nedeni:
        Görev Başlangıç Tarihi:
        Görev Bitiş Tarihi:
        Görev Yeri:
        
        Onaylayan:
        Ünvan:
        İmza:
        Tarih:
        Kurum Mühürü
      """,
    },
    {
      "title": "Seyahat İzin Belgesi",
      "url": "https://example.com/travel_permit.pdf",
      "description": "Seyahat izni almak için gerekli belge.",
      "content": """
        SEYAHAT İZİN BELGESİ
        
        Adı Soyadı:
        TC Kimlik No:
        Kurumu:
        Görevi:
        Seyahat Nedeni:
        Gidilecek Yer:
        Seyahat Başlangıç Tarihi:
        Seyahat Bitiş Tarihi:
        Konaklama Bilgileri:
        Ulaşım Bilgileri:
        
        Onaylayan:
        Ünvan:
        İmza:
        Tarih:
        Kurum Mühürü
      """,
    },
    {
      "title": "Fazla Mesai Formu",
      "url": "https://example.com/overtime_form.pdf",
      "description": "Fazla mesai bildirim formu.",
      "content": """
        FAZLA MESAİ BİLDİRİM FORMU
        
        Personel Adı Soyadı:
        Departman:
        Mesai Tarihi:
        Mesai Başlangıç Saati:
        Mesai Bitiş Saati:
        Toplam Mesai Süresi:
        Mesai Nedeni:
        Yapılan İşin Açıklaması:
        
        Onaylayan Yönetici:
        İmza:
        Tarih:
        
        İnsan Kaynakları Onayı:
        İmza:
        Tarih:
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

  Future<void> _openDocument(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Belge açılamadı!", style: TextStyle(color: AppColors.borderColor)),
          backgroundColor: Colors.red,
        ),
      );
    }
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
              "Faydalı Dokümanlar",
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
                  icon: const Icon(Icons.visibility, color: Colors.white),
                  label: const Text("Önizleme", style: TextStyle(color: Colors.white)),
                  onPressed: () => _launchUrl(context, document["url"]!),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.snackBarGreen),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.download, color: Colors.white),
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
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.borderColor),
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
