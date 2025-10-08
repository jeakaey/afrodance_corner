import 'package:flutter/material.dart';
import 'router/app_router.dart';

void main() {
  runApp(const AfrodanceCornerApp());
}

class AfrodanceCornerApp extends StatelessWidget {
  const AfrodanceCornerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Afrodance Corner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'Poppins',
      ),
      routerConfig: appRouter,
    );
  }
}
