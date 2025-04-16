import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/tgs_news/news_details_page.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newsItems = [
      {"title": "Yeni Uçuş Prosedürleri Duyuruldu!", "date": "10 Mart 2025"},
      {"title": "TGS Personel Eğitimi Programı", "date": "20 Ekim 2023"},
      {"title": "Havalimanı Güvenlik Güncellemeleri", "date": "8 Nisan 2025"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 120,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.9,
            enlargeCenterPage: false,
          ),
          items: newsItems.map((news) => NewsCard(title: news["title"]!, date: news["date"]!)).toList(),
        ),
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String date;

  const NewsCard({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.customCardColor,
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(color: AppColors.borderColor.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),

      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        dense: false,
        leading: Icon(Icons.notifications, size: 30, color: AppColors.borderColor),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.borderColor)),
        subtitle: Text(
          "Yayımlanma Tarihi: $date",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.borderColor),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsDetailsPage()));
        },
      ),
    );
  }
}
