import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      child: LayoutBuilder(builder:
       (context, constraints){
            final isLarge = constraints.maxWidth > 500;
            final scale = isLarge ? 1.5 : 1.0;
      
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          SizedBox(width: 15),
            Image(
              image: AssetImage('assets/images/tasties-logo.png'),
              height: 30 * scale,
              width: 60,
            ),
            SizedBox(width: 15),
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 30 * scale,
              width: 60,
            ),
             ] ),
            SizedBox(width: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                '© 2025 Afrodance Corner - Tous droits réservés',
                style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold ),
              ),
      ])
          ],
        );},
      ));
  }
}
