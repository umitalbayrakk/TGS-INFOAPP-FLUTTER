import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yeni Uçuş Prosedürleri Duyuruldu!",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(DateFormat.yMMMMd('tr_TR').format(DateTime.now()), style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/flight.png', fit: BoxFit.cover, width: double.infinity, height: 250),
            ),
            const SizedBox(height: 20),
            Text('''
TGS, 2025 yılı itibarıyla yeni uçuş prosedürlerini duyurdu. Bu prosedürler, havalimanı operasyonlarını daha verimli ve güvenli hale getirmeyi amaçlıyor. Uçuş güvenliği ve yolcu memnuniyeti ön planda tutuldu.
''', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 40),
            Text(
              "TGS Personel Eğitimi Programı",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              DateFormat.yMMMMd('tr_TR').format(DateTime.now().subtract(Duration(days: 1))),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/person.png', fit: BoxFit.cover, width: double.infinity, height: 250),
            ),
            const SizedBox(height: 20),
            Text('''
TGS, 2025 yılı için yeni personel eğitim programını başlattı. Bu program, tüm personelin iş güvenliği ve uçuş prosedürleri konularında eğitim almasını hedefliyor.
''', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 40),
            Text(
              "Havalimanı Güvenlik Güncellemeleri",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              DateFormat.yMMMMd('tr_TR').format(DateTime.now().subtract(Duration(days: 2))),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/security.png', fit: BoxFit.cover, width: double.infinity, height: 250),
            ),
            const SizedBox(height: 20),
            Text('''
Yeni güvenlik önlemleri ile yolcu güvenliğini artırmayı amaçlayan güncellemeler, tüm havalimanı personeline duyuruldu. Bu değişiklikler, daha hızlı ve güvenli bir seyahat deneyimi sağlayacak.
''', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
