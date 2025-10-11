import 'package:afrodance_corner/views/workshop/workshop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

Widget suscribeButton (Workshop myWorkshop, BuildContext context, double cost){
  return ElevatedButton(
                onPressed: (){
                _payWithPayPal(context, myWorkshop, cost);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
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
 void _payWithPayPal(BuildContext context, Workshop myWorkshop, double cost) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        // default account tk@gcom
        clientId: "AdcFopLyaMD-SM7f9GCUzYGu7Tvat2Vkc_LikR0JQfHhN1wSVzR-eVSn8jX0eo7xSLDS0oweV6A1pLwf",
        secretKey: "EHH7oW31NzaIlKpSLSuRMgLiyJPhSXY4zXPynvzrRygrhKEzXC2URjuSSvsbi6wL3-V7f2F8Z4H0RbNK",
        transactions: [
          {
            "amount": {
              "total": cost.toStringAsFixed(2),
              "currency": "EUR",
              "details": {
                "subtotal": cost.toStringAsFixed(2),
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "Paiement pour le workshop '${myWorkshop.theme}'",
            "item_list": {
              "items": [
                {
                  "name": myWorkshop.theme,
                  "quantity": 1,
                  "price": cost.toStringAsFixed(2),
                  "currency": "EUR"
                }
              ],
            }
          }
        ],
        note: "Paiement AfroDance Corner",
        onSuccess: (Map params) async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Paiement réussi ! Vous êtes inscrit.")),
          );

          await FirebaseFirestore.instance.collection('payments').add({
            'userId': FirebaseAuth.instance.currentUser?.uid,
            'workshop': myWorkshop.theme,
            'amount': cost,
            'currency': 'EUR',
            'status': 'success',
            'transactionId': params['id'],
            'createdAt': FieldValue.serverTimestamp(),
          });

          Navigator.pop(context);
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Erreur: $error")),
          );
          Navigator.pop(context);
        },
        onCancel: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Paiement annulé")),
          );
          Navigator.pop(context);
        },
      ),
    ));
  }