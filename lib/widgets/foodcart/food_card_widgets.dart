import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class TurkishFoodCard extends StatelessWidget {
  final VoidCallback? onTap;

  const TurkishFoodCard({super.key, this.onTap});

  static final List<Map<String, dynamic>> allTurkishFoods = [
    {
      'foodName': 'Adana Kebap',
      'category': 'Et Yemekleri',
      'description': 'Acılı kıyma kebabı, lavaşa sarılı.',
      'icon': Icons.local_dining,
    },
    {
      'foodName': 'İskender Kebap',
      'category': 'Et Yemekleri',
      'description': 'Döner, yoğurt ve tereyağıyla servis edilir.',
      'icon': Icons.restaurant,
    },
    {
      'foodName': 'Lahmacun',
      'category': 'Hamur İşleri',
      'description': 'Kıymalı ince hamur, limonla harika.',
      'icon': Icons.restaurant_menu,
    },
    {
      'foodName': 'Pide',
      'category': 'Hamur İşleri',
      'description': 'Kaşarlı veya kıymalı, fırından taze.',
      'icon': Icons.bakery_dining,
    },
    {
      'foodName': 'Menemen',
      'category': 'Kahvaltılık',
      'description': 'Domates, biber ve yumurtanın şahane uyumu.',
      'icon': Icons.egg,
    },
    {
      'foodName': 'Kumpir',
      'category': 'Aperatif',
      'description': 'Fırın patates, çeşitli malzemelerle dolu.',
      'icon': Icons.fastfood,
    },
    {
      'foodName': 'Baklava',
      'category': 'Tatlılar',
      'description': 'Fıstıklı, şerbetli ince katmanlı tatlı.',
      'icon': Icons.cake,
    },
    {
      'foodName': 'Künefe',
      'category': 'Tatlılar',
      'description': 'Peynirli, şerbetli sıcak tatlı.',
      'icon': Icons.local_cafe,
    },
    {
      'foodName': 'Köfte',
      'category': 'Et Yemekleri',
      'description': 'Baharatlı kıyma, ızgarada pişmiş.',
      'icon': Icons.local_dining,
    },
    {
      'foodName': 'Mantı',
      'category': 'Hamur İşleri',
      'description': 'Kıymalı mini hamurlar, yoğurtlu.',
      'icon': Icons.rice_bowl,
    },
    {
      'foodName': 'Dolma',
      'category': 'Sebze Yemekleri',
      'description': 'Biber veya yaprak, pirinçle doldurulmuş.',
      'icon': Icons.local_florist,
    },
    {
      'foodName': 'Kısır',
      'category': 'Salatalar',
      'description': 'Bulgur, nar ekşisi ve yeşillikle harman.',
      'icon': Icons.local_dining,
    },
    {
      'foodName': 'Mercimek Çorbası',
      'category': 'Çorbalar',
      'description': 'Kırmızı mercimek, limonla nefis.',
      'icon': Icons.soup_kitchen,
    },
    {
      'foodName': 'Sütlaç',
      'category': 'Tatlılar',
      'description': 'Fırınlanmış pirinç tatlısı.',
      'icon': Icons.local_cafe,
    },
    {
      'foodName': 'Hünkar Beğendi',
      'category': 'Et Yemekleri',
      'description': 'Patlıcan püresi üstüne et.',
      'icon': Icons.restaurant,
    },
  ];

  Map<String, dynamic> _getFoodItem() {
    final now = DateTime.now();
    final dayOfWeek = now.weekday;
    final index = (dayOfWeek - 1) % allTurkishFoods.length;
    return allTurkishFoods[index];
  }

  @override
  Widget build(BuildContext context) {
    final food = _getFoodItem();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cardColor3,
            // image: DecorationImage(image: AssetImage("assets/images/foodcard.png"), fit: BoxFit.fitWidth),
            borderRadius: BorderRadius.circular(12),
            // border: Border.all(color: AppColors.borderColor),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Günün Yemeği',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.borderColor),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(8)),
                    child: Icon(food['icon'], size: 40, color: AppColors.borderColor),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food['foodName'],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.borderColor),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            food['category'],
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.borderColor,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            food['description'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, color: AppColors.borderColor, height: 1.3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TurkishFoodList extends StatelessWidget {
  const TurkishFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return TurkishFoodCard(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Yemek seçildi!')));
          },
        );
      },
    );
  }
}
