import 'package:flutter/material.dart';
import '../../widget/header.dart';
import '../../widget/footer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: const Header(),
      ),
      body: Stack(
        children: [
          // 🌄 Image de fond
          Image.asset(
            'assets/images/hero-img.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // 🔳 Overlay sombre pour la lisibilité
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // 🌈 Contenu principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Center(
                child: Column(
                  children: [
                    // 🏷️ Titre
                    Text(
                      'Contactez-nous',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.deepOrange,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Une question, une suggestion ou une envie de collaborer ? '
                      'Nous serions ravis d’échanger avec vous !',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),

                    // 📋 Formulaire de contact
                    Container(
                      width: 600,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Nom',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty ? 'Veuillez entrer votre nom' : null,
                              onSaved: (value) => name = value,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer votre email';
                                } else if (!value.contains('@')) {
                                  return 'Email invalide';
                                }
                                return null;
                              },
                              onSaved: (value) => email = value,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: 'Message',
                                prefixIcon: Icon(Icons.message),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) => value == null || value.isEmpty
                                  ? 'Veuillez entrer un message'
                                  : null,
                              onSaved: (value) => message = value,
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Message envoyé avec succès'),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Envoyer',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // 📞 Coordonnées
                    Container(
                      width: 600,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Nos coordonnées',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(height: 20),
                          ListTile(
                            leading: Icon(Icons.location_on, color: Colors.deepOrange),
                            title: Text('Paul-Ehrlich-Str. 28, Kaiserslautern, Allemagne'),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone, color: Colors.deepOrange),
                            title: Text('+49 15773617625'),
                          ),
                          ListTile(
                            leading: Icon(Icons.email, color: Colors.deepOrange),
                            title: Text('afrodancecorner@gmail.com'),
                          ),
                          ListTile(
                            leading: Icon(Icons.tiktok, color: Colors.deepOrange),
                            title: Text('Afrodance corner'),
                          ),
                          
                        ],
                      ),
                    ),

                    const SizedBox(height: 60),
                   
                  ],
                ),
              ),
            ),
          ),
           const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}

