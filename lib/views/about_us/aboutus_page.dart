import 'package:flutter/material.dart';
import '../../widget/header.dart';
import '../../widget/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: const Header(),
      ),
      body: Stack(
        children: [
          // 🌄 Image de fond
          Image.asset(
            'assets/images/hero-img2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            opacity: const AlwaysStoppedAnimation(0.5),
          ),

          // 🖤 Overlay sombre pour la lisibilité
       

          // 🌈 Contenu principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 20),
              child: Column(
                children: [
                  // 🏷️ Titre principal
                  Text(
                    'À propos ',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // 📖 Texte de présentation
                  Container(
                    constraints: const BoxConstraints(maxWidth: 900),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Afrodance Corner est bien plus qu’un simple espace de danse — "
                      "c’est une communauté vibrante qui célèbre les danses afro-urbaines, "
                      "leur énergie, leur diversité et leur histoire. "
                      "Nous créons des espaces où chacun peut s’exprimer en dansant, "
                      "apprendre, se dépasser et surtout, partager sa passion pour la culture afro. "
                      "\n\nNos workshops réunissent des danseurs de tous niveaux, Que tu sois débutant ou confirmé,"
                      "icitu trouveras ton rythme ! "
                      "\n\nL'encadrement des differents ateliers sont coordonnés par des coachs passionnés et des animateurs DJs très talentueux. "
                      "Nous tenons a remercier nos partenaires qui nous accompagnent et nous soutiennent. Et bien sûr, un grand merci à notre incroyable"
                      " communauté de danseurs et danseuses qui rendent chaque session inoubliable.",
                    
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // 💪 Mission / Vision / Valeurs
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: const [
                      AboutCard(
                        icon: Icons.favorite,
                        title: 'Notre mission',
                        text:
                            'Faire découvrir et promouvoir les danses afro-urbaines, '
                            'dans un esprit de partage et divertissement.',
                      ),
                      AboutCard(
                        icon: Icons.visibility,
                        title: 'Notre vision',
                        text:
                            'Créer un espace d’expression artistique et culturelle '
                            'où chaque passionné de danse trouve sa place.',
                      ),
                      AboutCard(
                        icon: Icons.people,
                        title: 'Nos valeurs',
                        text:
                            'Respect, inclusion, passion et authenticité — les piliers '
                            'qui animent chaque session et chaque sourire.',
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 🌟 Widget réutilisable pour les cartes de section
class AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const AboutCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white.withOpacity(0.9),
      shadowColor: Colors.deepOrangeAccent.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(icon, size: 50, color: Colors.deepOrange),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
