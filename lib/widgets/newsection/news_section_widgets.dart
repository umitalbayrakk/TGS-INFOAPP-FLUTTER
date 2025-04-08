import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newsItems = [
      {"title": "Yeni Uçuş Prosedürleri Duyuruldu!", "date": "10 Mart 2025"},
      {"title": "TGS Personel Eğitimi Programı", "date": "20 Ekim 2023"},
      {"title": "Havalimanı Güvenlik Güncellemeleri", "date": "8 Nisan 2025"},
    ];

    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TGS Son Haberler",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.borderColor),
          ),
          SizedBox(height: 10),
          ...newsItems.map((news) => NewsCard(title: news["title"]!, date: news["date"]!)).toList(),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String date;

  const NewsCard({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.customCardColor,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Bootstrap.info_square, size: 30, color: AppColors.borderColor),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          "Yayımlanma Tarihi: $date",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.borderColor),
        ),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => TGSNewsDetailsPage()));
        },
      ),
    );
  }
}
