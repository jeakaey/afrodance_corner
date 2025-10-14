import 'package:afrodance_corner/views/workshop/workshop.dart';
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
         alignment: Alignment.topCenter,
        children: [
          //  Image de fond
          Image.asset(
            'assets/images/image2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            opacity: const AlwaysStoppedAnimation(0.9),
          ),
          SingleChildScrollView(
        child:LayoutBuilder(builder:
       (context, constraints){
            final isLarge = constraints.maxWidth > 400;
            final scale = isLarge ? 1.3 : 1.0;
        return 
         Column(
          children: [
            const SizedBox(height: 20),
            // Titre principal
            Text(
              'Les prochains workshops',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.deepOrange,
                    fontSize: 30 * scale,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 20),
            TextButton(  
              onPressed: () => context.go('/about_us'),
            child: Text(  'En quoi consiste nos ateliers de danses?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                    
                  ),
            )),
            const SizedBox(height: 20),
            //  Section des cards
            LayoutBuilder(
              builder: (context, constraints) {
                bool isLarge = constraints.maxWidth > 1000;
                double cardWidth =
                    isLarge ? constraints.maxWidth / 2.5 : constraints.maxWidth * 0.9;

                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    WorkshopCard(
                      width: cardWidth,
                      myWorkshop: Workshop(
                     date: "Samedi 13 Décembre 2025",
                      time: "13h - 18h",
                      place: "TU Kaiserslautern - Allemagne",
                      theme: "Noel en Afro",
                      dateLine: "Delai d'inscription: 30.11.2025"
                      ),
                     ),
                     SizedBox(height: 20),

                  ],
                );
              },
            ),
         SizedBox(height: 100,)
         
          ],
        );
  })),
       const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Footer(),
          ),   
   ] ));
  }
}