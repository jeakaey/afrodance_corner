import 'package:afrodance_corner/views/workshop/workshop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget suscribeButton(
  Workshop myWorkshop,
  String cost,
  bool isChecked,
  BuildContext context,
) {
  return ElevatedButton(
    onPressed: () async {
      if (isChecked) {
        // Si la case est cochée → paiement via PayPal
        await _launchPaypal(cost, myWorkshop);
      } else {
        // Si non cochée → afficher une alerte
        _showConsentDialog(context);
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isChecked ? Colors.deepOrange : Colors.grey, // 🔸 grisé si non coché
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    child: const Text(
      "S'inscrire",
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

///  Fonction d’ouverture de PayPal
Future<void> _launchPaypal(String cost, Workshop myWorkshop) async {
  final Uri url = Uri.parse("https://paypal.me/Afrodancecorner/$cost");

  // Enregistrer l’intention de paiement dans Firestore
  await FirebaseFirestore.instance.collection('payments_triggered').add({
    'userEmail': FirebaseAuth.instance.currentUser?.email,
    'amount': cost,
    'workshop': myWorkshop.theme,
    'paidAt': FieldValue.serverTimestamp(),
    'status': 'redirected_to_paypal',
  });

  // Ouvrir PayPal
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Impossible d’ouvrir PayPal';
  }
}

///  Fonction pour afficher une alerte
void _showConsentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          "Consentement requis",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Veuillez accepter les conditions de participation avant de continuer. "
          "Cochez la case confirmant votre accord sur l'utilisation des photos et vidéos.",
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK", style: TextStyle(color: Colors.black)),
          ),
        ],
      );
    },
  );
}
