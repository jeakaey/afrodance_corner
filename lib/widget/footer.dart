import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      child: const Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          SizedBox(width: 15),
            Image(
              image: AssetImage('assets/images/tasties-logo.png'),
              height: 80,
              width: 100,
            ),
            SizedBox(width: 15),
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 80,
              width: 80,
            ),
             ] ),
            SizedBox(width: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text(
                '© 2025 Afrodance Corner - Tous droits réservés',
                style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold ),
              ),
      ])
          ],
        ),
      ));
  }
}
