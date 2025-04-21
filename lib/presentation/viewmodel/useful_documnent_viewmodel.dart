import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/views/useful_document/useful_document_view.dart';
import 'package:url_launcher/url_launcher.dart';

class UsefulDocumentViewModel with ChangeNotifier {
  final List<Map<String, String>> _documents = [
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

  List<Map<String, String>> get documents => _documents;

  Future<bool> downloadDocument(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        return true;
      }
      return false;
    } catch (e) {
      print("Hata: Belge indirilemedi: $e");
      return false;
    }
  }

  void navigateToDetailPage(BuildContext context, Map<String, String> document) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DocumentDetailPage(document: document),
      ),
    );
  }
}