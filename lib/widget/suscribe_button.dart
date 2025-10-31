import 'dart:math';
import 'dart:html' as html ;
import 'package:flutter/foundation.dart' show kIsWeb ;
import 'package:afrodance_corner/views/workshop/workshop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    onPressed: () async {
      if (isChecked) {
        // if checkbox marked redirect to PayPal
        await _launchPaypal(cost, myWorkshop);
      } else {
        // if not marked show alert dialog
        _showConsentDialog(context);
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isChecked
          ? Colors.deepOrange
          : Colors.grey, // Button color based on checkbox
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    child: Text(
      l10n.suscribeButtonTitle,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Future<void> _launchPaypal(String cost, Workshop myWorkshop) async {
  final Uri url = Uri.parse("https://paypal.me/Afrodancecorner/$cost");

  //save payment trigger in Firestore
  await FirebaseFirestore.instance.collection('payments_triggered').add({
    'userEmail': FirebaseAuth.instance.currentUser?.email,
    'amount': cost,
    'workshop': myWorkshop.theme,
    'paidAt': FieldValue.serverTimestamp(),
    'status': 'redirected_to_paypal',
  });

  // Ouvrir PayPal
  if (await canLaunchUrl(url)) {
    if (kIsWeb) {
    html.window.open(url.toString(), '_blank');
  } else {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
  } else {
    throw "Unable to open PayPal";
  }
}

///  Fonction pour afficher une alerte
void _showConsentDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          l10n.suscribeButtonAlertDialogTitle,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Text(
          l10n.suscribeButtonAlertDialogText,
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
