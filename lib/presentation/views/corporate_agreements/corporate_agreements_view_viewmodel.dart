import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/views/corporate_agreements/corporate_agreements_view.dart';

class CorporateAgreementsViewModel {
  final List<CorporateAgreement> agreements = [
    CorporateAgreement(
      id: '1',
      title: "THY ile Yer Hizmetleri Anlaşması",
      description:
          "Türk Hava Yolları ile İstanbul Havalimanı'nda yenilikçi ve hızlı yer hizmetleri sunmak için yapılan iş birliği.",
      icon: Icons.flight_takeoff,
      partnerLogo: 'assets/logos/thy.png',
      startDate: DateTime(2023, 1, 15),
      endDate: DateTime(2026, 1, 15),
      benefits: [
        "Yıllık %15 operasyonel verimlilik artışı",
        "30+ yeni istihdam",
        "Yolcu memnuniyetinde %20 iyileşme",
      ],
    ),
    CorporateAgreement(
      id: '2',
      title: "Sürdürülebilir Yer Hizmetleri",
      description:
          "THY ve çevre dostu teknoloji firması X ile apron operasyonlarında karbon salımını azaltmak için anlaşma.",
      icon: Icons.eco,
      partnerLogo: 'assets/logos/thy_x.png',
      startDate: DateTime(2022, 5, 10),
      endDate: DateTime(2025, 5, 10),
      benefits: [
        "Karbon ayak izinde %25 azalma",
        "Elektrikli yer hizmet araçları",
        "Sürdürülebilirlik sertifikası",
      ],
    ),
    CorporateAgreement(
      id: '3',
      title: "Dijital Check-in ve Bagaj Sistemi",
      description:
          "THY ile yolcu işlemlerini dijitalleştirme ve bagaj süreçlerini optimize etme amaçlı teknolojik iş birliği.",
      icon: Icons.cloud_upload,
      partnerLogo: 'assets/logos/thy.png',
      startDate: DateTime(2023, 3, 1),
      endDate: DateTime(2024, 3, 1),
      benefits: [
        "Check-in sürelerinde %40 azalma",
        "Gerçek zamanlı bagaj takibi",
        "Mobil uygulama entegrasyonu",
      ],
    ),
    CorporateAgreement(
      id: '4',
      title: "THY Kargo Yer Hizmetleri",
      description:
          "THY Kargo ile hızlı ve güvenilir kargo elleçleme hizmetleri için İstanbul ve Ankara'da genişletilmiş iş birliği.",
      icon: Icons.local_shipping,
      partnerLogo: 'assets/logos/thy_cargo.png',
      startDate: DateTime(2024, 2, 20),
      endDate: DateTime(2027, 2, 20),
      benefits: [
        "Kargo işlem sürelerinde %30 hızlanma",
        "5 yeni kargo deposu",
        "Uluslararası standartlarda hizmet",
      ],
    ),
    CorporateAgreement(
      id: '5',
      title: "Personel Eğitim ve Gelişim",
      description:
          "THY Akademi ile yer hizmetleri personelinin yetkinliklerini artırmak için ortak eğitim programı.",
      icon: Icons.school,
      partnerLogo: 'assets/logos/thy_akademi.png',
      startDate: DateTime(2023, 6, 1),
      endDate: DateTime(2025, 6, 1),
      benefits: [
        "600+ personel için eğitim",
        "Hizmet kalitesinde %25 artış",
        "Uluslararası sertifikasyon",
      ],
    ),
    CorporateAgreement(
      id: '6',
      title: "Yenilenebilir Enerji ile Apron Operasyonları",
      description:
          "THY ve Y firması ile apron araçlarında güneş enerjisi kullanımını artırmak için yapılan iş birliği.",
      icon: Icons.energy_savings_leaf,
      partnerLogo: 'assets/logos/thy_y.png',
      startDate: DateTime(2024, 1, 10),
      endDate: DateTime(2028, 1, 10),
      benefits: [
        "Enerji maliyetlerinde %30 tasarruf",
        "Elektrikli pushback araçları",
        "Çevresel etki raporlaması",
      ],
    ),
  ];

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  void showAgreementDetails(BuildContext context, CorporateAgreement agreement) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        builder: (context, scrollController) => AgreementDetailsSheet(
          agreement: agreement,
          scrollController: scrollController,
          viewModel: this,
        ),
      ),
    );
  }
}

class CorporateAgreement {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String partnerLogo;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> benefits;

  CorporateAgreement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.partnerLogo,
    required this.startDate,
    required this.endDate,
    required this.benefits,
  });
}