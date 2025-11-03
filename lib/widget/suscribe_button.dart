import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:afrodance_corner/views/workshop/workshop.dart';
import 'package:afrodance_corner/l10n/app_localizations.dart';


/// Bouton d'inscription à un workshop
Widget suscribeButton(
  Workshop myWorkshop,
  String cost,
  bool isChecked,
  BuildContext context,
) {
  final l10n = AppLocalizations.of(context)!;

  return ElevatedButton(
    onPressed: () async {
      if (isChecked) {
        // ✅ Checkbox cochée : rediriger vers PayPal
        await _launchPaypal(cost, myWorkshop);
      } else {
        // 🚫 Sinon, afficher un message d’avertissement
        _showConsentDialog(context);
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isChecked ? Colors.deepOrange : Colors.grey,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    child: Text(
      l10n.suscribeButtonTitle,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

/// ✅ Fonction de redirection PayPal (compatible iOS, Android et Web)
Future<void> _launchPaypal(String cost, Workshop myWorkshop) async {
  final Uri url = Uri.parse("https://paypal.me/Afrodancecorner/$cost");

  // 🔹 Enregistrer le déclenchement du paiement
  await FirebaseFirestore.instance.collection('payments_triggered').add({
    'userEmail': FirebaseAuth.instance.currentUser?.email,
    'amount': cost,
    'workshop': myWorkshop.theme,
    'paidAt': FieldValue.serverTimestamp(),
    'status': 'redirected_to_paypal',
  });

  // 🔹 Redirection PayPal
  if (kIsWeb) {
    // ✅ Méthode 100 % compatible Safari & iOS
    final anchor = html.AnchorElement(href: url.toString())
      ..target = '_blank'
      ..rel = 'noopener noreferrer';
    anchor.click();
  } else {
    // ✅ Autres plateformes (Android, Desktop, etc.)
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch PayPal';
    }
  }
}

/// ⚠️ Affiche une boîte de dialogue si l’utilisateur n’a pas accepté la clause photo/vidéo
void _showConsentDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          l10n.suscribeButtonAlertDialogTitle,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          l10n.suscribeButtonAlertDialogText,
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}
