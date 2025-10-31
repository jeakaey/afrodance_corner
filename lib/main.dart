import 'package:afrodance_corner/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AfrodanceCornerApp());
}

class AfrodanceCornerApp extends StatefulWidget {
  const AfrodanceCornerApp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    _AfrodanceCornerApp? state = context
        .findAncestorStateOfType<_AfrodanceCornerApp>();
    state?.changeLanguage(locale);
  }

  @override
  State<AfrodanceCornerApp> createState() => _AfrodanceCornerApp();
}

class _AfrodanceCornerApp extends State<AfrodanceCornerApp> {
  Locale _locale = const Locale('de');

  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: _locale, // langue par défaut
      supportedLocales: const [Locale('de'), Locale('fr'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate, // on le crée juste après
      ],
      title: 'Afrodance Corner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: 'Poppins'),
      routerConfig: appRouter,
    );
  }
}
