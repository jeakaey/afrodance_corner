import 'package:afrodance_corner/views/about_us/aboutus_page.dart';
import 'package:afrodance_corner/views/login/login_page.dart';
//import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/home/home_page.dart';
import '../views/workshop/workshop_page.dart';
import '../views/contact/contact_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/workshop',
      name: 'workshop',
      builder: (context, state) => const WorkshopsPage(),
    ),
    GoRoute(
      path: '/contact',
      name: 'contact',
      builder: (context, state) => const ContactPage(),
    ),
    GoRoute(
      path: '/about_us',
      name: 'about_us',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
