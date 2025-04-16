import 'package:flutter/material.dart';

class foodText extends StatelessWidget {
  const foodText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(children: [Text("Günün Yemeği", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]),
    );
  }
}

class bornText extends StatelessWidget {
  const bornText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(children: [Text("Bu Gün Doğanlar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]),
    );
  }
}

class LastNewsText extends StatelessWidget {
  const LastNewsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(children: [Text("TGS Son Haberler", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))]),
    );
  }
}
