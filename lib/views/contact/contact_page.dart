import 'package:flutter/material.dart';
import '../../widget/header.dart';
import '../../widget/footer.dart';
import 'package:afrodance_corner/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
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
         // Container(color: Colors.black.withOpacity(0.4)),

          // 🌈 Contenu principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Center(
                child: Column(
                  children: [
                    // 🏷️ Titre
                    Text(
                      l10n.contactPageSubtitle,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: Colors.deepOrange,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.contactPageText,
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
                              decoration: InputDecoration(
                                labelText: l10n.labelTextName,
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? l10n.validatorCheckName
                                  : null,
                              onSaved: (value) => name = value,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: l10n.labelTextEmail,
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return l10n.validatorCheckEmail;
                                } else if (!value.contains('@')) {
                                  return l10n.validatorCheckInvalidEmail;
                                }
                                return null;
                              },
                              onSaved: (value) => email = value,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                labelText: l10n.labelTextMessage,
                                prefixIcon: Icon(Icons.message),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? l10n.validatorCheckMessage
                                  : null,
                              onSaved: (value) => message = value,
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        l10n.contactPageSnackbarSucessMessage,
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                l10n.contactPageSendButton,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                      child: Column(
                        children: [
                          Text(
                            l10n.contactPageInfoSubtitle,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(height: 20),
                          ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: Colors.deepOrange,
                            ),
                            title: Text(l10n.contactPageAdress),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.deepOrange,
                            ),
                            title: Text(l10n.contactPageTelefon),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.email,
                              color: Colors.deepOrange,
                            ),
                            title: Text(l10n.contactPageEmail),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.tiktok,
                              color: Colors.deepOrange,
                            ),
                            title: Text(l10n.contactPageTiktok),
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
          const Positioned(left: 0, right: 0, bottom: 0, child: Footer()),
        ],
      ),
    );
  }
}
