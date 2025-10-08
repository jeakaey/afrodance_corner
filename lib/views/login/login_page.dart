import 'package:flutter/material.dart';
import '../../widget/header.dart';
import '../../widget/footer.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true; // toggle between login/register

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();  
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: const Header(),
      ),
      
      body: Stack(
        children: [
          // 🖼️ Image de fond
          Image.asset(
            'assets/images/image1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            opacity: const AlwaysStoppedAnimation(0.5),
          ),
         LayoutBuilder(
         builder: (context, constraints) {
          final isLarge = constraints.maxWidth > 600;
          final scale = isLarge ? 1.5 : 1.0;

              return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24 * scale,
                    vertical: 60 * scale,
                  ),
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: isLarge ? 500 : double.infinity,
                      padding: EdgeInsets.all(24 * scale),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20 * scale),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isLogin
                                ? 'Connexion'
                                : 'Inscription',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Email
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Entrez votre email' : null,
                          ),
                          const SizedBox(height: 20),

                          // Password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Mot de passe',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            validator: (value) => value!.length < 6
                                ? 'Au moins 6 caractères'
                                : null,
                          ),
                          const SizedBox(height: 20),

                          // Confirm password (only register)
                          if (!isLogin)
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Confirmez le mot de passe',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock_outline),
                              ),
                              validator: (value) => value !=
                                      _passwordController.text
                                  ? 'Les mots de passe ne correspondent pas'
                                  : null,
                            ),
                          if (!isLogin) const SizedBox(height: 20),

                          // Submit Button
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // do login or registration here
                                context.go('/workshop');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              padding: EdgeInsets.symmetric(
                                horizontal: 25 * scale,
                                vertical: 15 * scale,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              isLogin ? 'Se connecter' : 'S\'enregistrer',
                              style: TextStyle(
                                fontSize: 14 * scale,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Switch mode
                          TextButton(
                            onPressed: () {
                              setState(() => isLogin = !isLogin);
                            },
                            child: Text(
                              isLogin
                                  ? "Pas encore de compte ? Enregistrez-vous"
                                  : "Déjà un compte ? Connectez-vous",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 12 * scale,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                           TextButton(
                      onPressed: () => context.go('/workshop'),
                      child: Text(
                        'Nos prochains workshops!',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 10 * scale,
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                        ),
                   ),)
                        ],
                      ),
                    ),
                    
                   ),
                ));
              },
            ),
          // Footer
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Footer(),
          ),
        ],
      ));
    }
  }

  
