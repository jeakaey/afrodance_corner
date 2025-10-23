import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widget/header.dart';
import '../../widget/footer.dart';
import 'package:afrodance_corner/l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
            'assets/images/hero-img2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            opacity: const AlwaysStoppedAnimation(0.9),
          ),

          //  Overlay sombre pour la lisibilité
       

          //  Contenu principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 20),
              child: Column(
                children: [
                  //  Titre principal
                  Text(
                    l10n.aboutusPageTitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // Texte de présentation
                  Container(
                    constraints: const BoxConstraints(maxWidth: 900),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                     l10n.aboutusPageADCText,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                   const SizedBox(height: 20),
                    
                      Container(
                      constraints: const BoxConstraints(maxWidth: 900),
                      padding: const EdgeInsets.all(24),
                       decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                    ),
                     child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                           Text(
                               l10n.aboutusPageSubtitle,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 32,),
                            textAlign: TextAlign.center, ),
                           const SizedBox(height: 20),
                           const Divider(
                              thickness: 2,
                              indent: 100,
                              endIndent: 100,
                              color: Colors.deepOrange,
                            ),
                           const SizedBox(height: 30),
                      Text(
                        "C’est avant tout une après-midi rythmée durant laquelle "
                        "les participants inscrits à nos ateliers apprennent de nouvelles "
                        "chorégraphies sur des sons principalement afro. Accompagnés par leur coach, "
                        "ils sont guidés pas à pas dans chaque mouvement avec passion et énergie.\n\n"
                        "La séance se divise en trois temps forts : les échauffements, "
                        "une mini-chorégraphie tendance (souvent inspirée des danses virales TikTok), "
                        "et une chorégraphie principale preparée par leur coach. "
                        "Nous invitons tous les participants à venir motivés, à l’heure, "
                        "et prêts à se faire plaisir sur la piste de danse !\n\n"
                        "Afrodance Corner, c’est aussi un lieu d’échanges, de rencontres et de partages "
                        "entre passionnés de danse, dans une ambiance conviviale et vibrante.",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.6,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                        textAlign: TextAlign.justify,
                      ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                 context.go('/workshop');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                icon: const Icon(Icons.local_activity, color: Colors.white),
                label: const Text(
                  "S'inscrire à notre prochain workshop",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),])),
          
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
        ]))),const Positioned(bottom: 0.0, left:0.0, right: 0.0,child: Footer())]));
           
}}

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
