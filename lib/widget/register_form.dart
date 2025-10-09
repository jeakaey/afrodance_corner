import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();  
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  SnackBar accountCreatedSnackbar = const SnackBar(content: Text('Votre compte a ete créé avec succès!'));
  SnackBar passwordMismatchSnackbar = const SnackBar(content: Text('Les mots de passe ne correspondent pas'));
  SnackBar accountNotCreatedSnackbar = const SnackBar(content: Text('Erreur lors de la création du compte'));
  Future<void> _register() async {
  // Create user with email and password in Firebase Auth
    try {
     final _infos =  await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Store additional user info in Firestore
      await _firestore.collection('users').doc(_infos.user?.uid).set({
        'surname': _surnameController.text.trim(),
        'name': _nameController.text.trim(),
        'sex': _sexController.text.trim(),
        'dateOfBirth': _dateOfBirthController.text.trim(),
        'phone': _phoneController.text.trim(),
        'address': _addressController.text.trim(),
        'email': _emailController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
        
      });

      ScaffoldMessenger.of(context).showSnackBar(
        accountCreatedSnackbar,
      );
      // redirect to home
      Navigator.pushReplacementNamed(context, '/workshop');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de la création du compte: ${e.message}')),
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
                            'Créer un compte',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Surname  
                          TextFormField(
                            controller: _surnameController,
                            decoration: const InputDecoration(
                              labelText: 'Nom',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Entrez votre nom' : null,
                          ),
                          const SizedBox(height: 20),
                          // name
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Prénom',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Entrez votre prénom' : null,
                          ),
                          const SizedBox(height: 20),
                          //dob
                         TextFormField(
                            controller: _dateOfBirthController,
                            decoration: const InputDecoration(
                              labelText: 'Date de naissance',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            // validator: (value) =>
                            //     value!.isEmpty ? 'Entrez votre date de naissance' : null,
                          ),
                          const SizedBox(height: 20),
                          // sex
                          TextFormField(
                            controller: _sexController,
                            decoration: const InputDecoration(
                              labelText: 'Sexe',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.wc),
                            ),
                            // validator: (value) =>
                            //     value!.isEmpty ? 'Entrez votre sexe' : null,
                          ),
                          const SizedBox(height: 20),
                          // phone
                         TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Téléphone',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.phone),
                            ),
                            // validator: (value) =>
                            //     value!.isEmpty ? 'Entrez votre numéro de téléphone' : null,
                          ),
                          const SizedBox(height: 20),
                          // address
                          TextFormField(
                            controller: _addressController,
                            decoration: const InputDecoration(
                              labelText: 'Adresse',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.home),
                            ),
                            // validator: (value) =>
                            //     value!.isEmpty ? 'Entrez votre adresse' : null,
                          ),
                          const SizedBox(height: 20),
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
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Confirmer le mot de passe',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            validator: (value) => value != _passwordController.text
                                ? 'Les mots de passe ne correspondent pas'
                                : null,
                          ),
                       const SizedBox(height: 30),
                          // Submit Button
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                  _register();
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
                              'S\'enregistrer',
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