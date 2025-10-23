import 'package:flutter/material.dart';
import 'package:afrodance_corner/widget/header.dart';
import 'package:afrodance_corner/widget/footer.dart';
import 'package:afrodance_corner/widget/login_form.dart';
import 'package:afrodance_corner/widget/register_form.dart';
import 'package:afrodance_corner/l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true; // toggle between login/register

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: const Header(),
      ),
      body: Stack(
        children: [
          /// Background Image
          Image.asset(
            'assets/images/image1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
           // opacity: const AlwaysStoppedAnimation(0.9),
          ),

          /// Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 120,
            ), // ⬅️ leave space for footer
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  ///  This part switches
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, anim) =>
                        FadeTransition(opacity: anim, child: child),
                    child: isLogin
                        ? const LoginForm(key: ValueKey('login'))
                        : const RegisterForm(key: ValueKey('register')),
                  ),

                  ///  This stays visible for both forms
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin
                          ? l10n.loginPageCreateAccountTextButton
                          : l10n.loginPageLoginTextButton,
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 0),
                ],
              ),
            ),
          ),

          ///  Fixed footer at bottom
          const Positioned(left: 0, right: 0, bottom: 0, child: Footer()),
        ],
      ),
    );
  }
}
