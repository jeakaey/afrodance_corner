import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widget/header.dart';
import '../../widget/footer.dart';
import 'package:afrodance_corner/l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                      opacity: const AlwaysStoppedAnimation(0.9),
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
                            l10n.welcomePageTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: Colors.deepOrange,
                                  fontSize: 40 * scale,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(height: 20 * scale),
                          Text(
                            l10n.welcomePageJoinusText,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge
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
                              l10n.welcomePageSubscribeButton,
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
