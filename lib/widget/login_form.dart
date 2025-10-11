import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();  

  final _auth = FirebaseAuth.instance;
  

  Future<void> _login() async {
  
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Connexion réussie ✅')),
      );
      // redirect to home
     context.go( '/workshop');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Erreur de connexion')),
      );
    } 
  }

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
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
                            'Connexion',
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
                       
                          // Submit Button
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                  _login();
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
                              'Se connecter',
                              style: TextStyle(
                                fontSize: 14 * scale,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                          
                        ],
                      ),
                    ),
                    
                   ),
                ));
              },
            );
  }
}