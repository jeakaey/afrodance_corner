import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widget/header.dart';
import '../../widget/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: const Header(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isLarge = constraints.maxWidth > 1100;
                final scale = isLarge ? 1.5 : 1.0;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background image
                    Image.asset(
                      'assets/images/hero-img.png',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.8,
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(0.7),
                    ),

                    // Foreground content
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24 * scale,
                        vertical: 60 * scale,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Bienvenue à Afrodance Corner!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.deepOrange,
                                  fontSize: 40 * scale,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(height: 20 * scale),  
                          Text(
                            'Viens rejoindre notre communauté passionnée de danse\n'
                            'africaine et découvre les rythmes envoûtants, les mouvements vibrants,\n'
                            'et l\'énergie contagieuse qui font de chaque session de nos ateliers une expérience inoubliable.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 18 * scale,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(height: 40 * scale),
                          ElevatedButton(
                            onPressed: () => context.go('/login'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              padding: EdgeInsets.symmetric(
                                horizontal: 40 * scale,
                                vertical: 20 * scale,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20 * scale),
                              ),
                            ),
                            child: Text(
                              'Inscris-toi à notre prochaine session',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20 * scale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
