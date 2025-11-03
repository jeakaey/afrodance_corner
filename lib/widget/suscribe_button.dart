import 'package:afrodance_corner/views/workshop/workshop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js; // 
import 'package:url_launcher/url_launcher.dart';
import 'package:afrodance_corner/l10n/app_localizations.dart';

Widget suscribeButton(
  Workshop myWorkshop,
  String cost,
  bool isChecked,
  BuildContext context,
) {
  final l10n = AppLocalizations.of(context)!;

  return ElevatedButton(
    onPressed: () {
      if (isChecked) {
        _openPaypalImmediately(cost, myWorkshop);
      } else {
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

///  Ouvre PayPal immédiatement (synchrone) pour éviter le blocage sur iOS Safari
void _openPaypalImmediately(String cost, Workshop myWorkshop) async {
final paypalUrl = "https://paypal.me/Afrodancecorner/$cost";

if (kIsWeb) {
  // Utilise la fonction JS définie dans index.html
  // ignore: undefined_prefixed_name
  await js.context.callMethod('openPayPal', [paypalUrl.toString()]);
} else {
  final uri = Uri.parse(paypalUrl);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}


  //  Sauvegarde Firestore en arrière-plan (non bloquant)
  FirebaseFirestore.instance.collection('payments_triggered').add({
    'userEmail': FirebaseAuth.instance.currentUser?.email,
    'amount': cost,
    'workshop': myWorkshop.theme,
    'paidAt': FieldValue.serverTimestamp(),
    'status': 'redirected_to_paypal',
  });
}

/// 🔔 Affiche un message d’alerte si le consentement n’est pas coché
void _showConsentDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          l10n.suscribeButtonAlertDialogTitle,
          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Text(
          l10n.suscribeButtonAlertDialogText,
          style: const TextStyle(fontSize: 14),
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
