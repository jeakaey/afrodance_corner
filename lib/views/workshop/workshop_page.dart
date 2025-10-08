import 'package:afrodance_corner/widget/footer.dart';
import 'package:afrodance_corner/widget/header.dart';
import 'package:afrodance_corner/widget/workshopcard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class WorkshopsPage extends StatelessWidget {
  const WorkshopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: const Header(),
      ),
        body: Stack(
        children: [
          // 🖼️ Image de fond
          Image.asset(
            'assets/images/image2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            opacity: const AlwaysStoppedAnimation(0.5),
          ),

          // 🖤 Couche de fondu sombre pour lisibilité
          // Container(
          //   color: Colors.black.withOpacity(0.3),
          // ),

          // 🌈 Contenu principal
          SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // 🏷️ Titre principal
            Text(
              'Les prochains Workshops',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.deepOrange,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 30),

            // 💠 Section des cards
            LayoutBuilder(
              builder: (context, constraints) {
                bool isLarge = constraints.maxWidth > 800;
                double cardWidth =
                    isLarge ? constraints.maxWidth / 3.2 : constraints.maxWidth * 0.9;

                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    WorkshopCard(
                      width: cardWidth,
                      date: "Samedi 13 Décembre 2025",
                      time: "14h - 18h",
                      place: "TU Kaiserslautern - Allemagne",
                      theme: "Noel en Afro",
                      coach: "Amanda Queen",
                      dj: "Sylvio",
                      cost: "15€",
                      onPressed: () => context.go('/login'),
                    ),
                    WorkshopCard(
                      width: cardWidth,
                      date: "Samedi 21 Février 2025",
                      time: "14h - 18h",
                      place: "TU Kaiserslautern - Allemagne",
                      theme: "African Lovebeat",
                      coach: "Amanda Queen",
                      dj: " Sylvio",
                      cost: "15€",
                      onPressed: () => context.go('/login'),
                    ),
                    WorkshopCard(
                      width: cardWidth,
                      date: "Bientôt disponible",
                      time: "Bientôt disponible",
                      place: "Bientôt disponible",
                      theme: "Bientôt disponible",
                      coach: "Bientôt disponible",
                      dj: "Bientôt disponible",
                      cost: "0€",
                      onPressed: () => context.go('/login'),
                    ),
                  ],
                );
              },
            ),
           
          //  const Footer(),
          ],
        ),
      ),
   ] ));
  }
}