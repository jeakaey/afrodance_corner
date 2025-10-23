import 'package:afrodance_corner/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:afrodance_corner/main.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isLarge = constraints.maxWidth > 500;
          final scale = isLarge ? 1.5 : 1.0;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo.png', height: 50 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Afrodance Corner',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20 * scale,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Arial",
                    ),
                  ),
                ],
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 500) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            hoverColor: Colors.deepOrange.shade200,
                            onPressed: () => context.go('/login'),
                            icon: const Icon(Icons.login, color: Colors.black),
                          ),
                          const SizedBox(width: 30),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>((
                                    states,
                                  ) {
                                    if (states.contains(
                                      MaterialState.hovered,
                                    )) {
                                      return Colors.deepOrange.shade200;
                                    }
                                    return Colors.transparent;
                                  }),
                            ),
                            onPressed: () => context.go('/'),
                            child: Text(
                              l10n.headerMenuHome,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>((
                                    states,
                                  ) {
                                    if (states.contains(
                                      MaterialState.hovered,
                                    )) {
                                      return Colors.deepOrange.shade200;
                                    }
                                    return Colors.transparent;
                                  }),
                            ),
                            onPressed: () => context.go('/workshop'),
                            child: Text(
                              l10n.headerMenuWorkshop,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>((
                                    states,
                                  ) {
                                    if (states.contains(
                                      MaterialState.hovered,
                                    )) {
                                      return Colors.deepOrange.shade200;
                                    }
                                    return Colors.transparent;
                                  }),
                            ),
                            onPressed: () => context.go('/about_us'),
                            child: Text(
                              l10n.headerMenuAboutus,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>((
                                    states,
                                  ) {
                                    if (states.contains(
                                      MaterialState.hovered,
                                    )) {
                                      return Colors.deepOrange.shade200;
                                    }
                                    return Colors.transparent;
                                  }),
                            ),
                            onPressed: () => context.go('/contact'),
                            child: Text(
                              l10n.headerMenuContact,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ); // Return an empty container for small screens
                    } else {
                      // Petit écran : bouton menu
                      return PopupMenuButton(
                        icon: const Icon(Icons.menu, color: Colors.black),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: ListTile(
                              title: Text(l10n.headerMenuLogin),
                              leading: const Icon(
                                Icons.login,
                                color: Colors.black,
                              ),
                              onTap: () => context.go('/login'),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: Text(l10n.headerMenuHome),
                              leading: const Icon(
                                Icons.home,
                                color: Colors.black,
                              ),
                              onTap: () => context.go('/'),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: Text(l10n.headerMenuWorkshop),
                              leading: const Icon(
                                Icons.class_sharp,
                                color: Colors.black,
                              ),
                              onTap: () => context.go('/workshop'),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: Text(l10n.headerMenuAboutus),
                              leading: const Icon(
                                Icons.info,
                                color: Colors.black,
                              ),
                              onTap: () => context.go('/about_us'),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: Text(l10n.headerMenuContact),
                              leading: const Icon(
                                Icons.contact_mail,
                                color: Colors.black,
                              ),
                              onTap: () => context.go('/contact'),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              PopupMenuButton<Locale>(
                icon: const Icon(Icons.language, color: Colors.black),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: Locale('fr'),
                    child: ListTile(
                      title: Text(l10n.headerLanguageFrench),
                      onTap: () {
                        Navigator.pop(context);
                        AfrodanceCornerApp.setLocale(
                          context,
                          const Locale('fr'),
                        );
                      },
                    ),
                  ),
                  PopupMenuItem(
                    value: Locale('en'),
                    child: ListTile(
                      title: Text(l10n.headerLanguageEnglish),
                      onTap: () {
                        Navigator.pop(context);
                        AfrodanceCornerApp.setLocale(
                          context,
                          const Locale('en'),
                        );
                      },
                    ),
                  ),
                  PopupMenuItem(
                    value: Locale('de'),
                    child: ListTile(
                      title: Text(l10n.headerLanguageGerman),
                      onTap: () {
                        Navigator.pop(context);
                        AfrodanceCornerApp.setLocale(
                          context,
                          const Locale('de'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
