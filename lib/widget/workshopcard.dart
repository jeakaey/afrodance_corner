import 'package:flutter/material.dart';
import 'package:afrodance_corner/views/workshop/workshop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
class WorkshopCard extends StatelessWidget {
  final double width;
  final VoidCallback onPressed;
  final Workshop myWorkshop;

  const WorkshopCard({
    super.key,
    required this.width,
    required this.onPressed,
    required this.myWorkshop,
  });
 

  @override
  Widget build(BuildContext context) {
   
    return Card(
      elevation: 6,
      shadowColor: Colors.deepOrangeAccent.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header du card
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  myWorkshop.theme,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    myWorkshop.cost.toStringAsFixed(2),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // Infos du workshop
            _infoLine(Icons.calendar_today, myWorkshop.date),
            _infoLine(Icons.access_time, myWorkshop.time),
            _infoLine(Icons.place, myWorkshop.place),
            _infoLine(Icons.person, "Coach : $myWorkshop.coach"),
            _infoLine(Icons.music_note, "DJ : $myWorkshop.dj"),
            const SizedBox(height: 20),

            //  Bouton S'inscrire
            Center(
              child: ElevatedButton(
                onPressed: (){
                _payWithPayPal(context, myWorkshop);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoLine(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepOrange, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

   void _payWithPayPal(BuildContext context, Workshop workshop) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        // default account tk@gcom
        clientId: "AdcFopLyaMD-SM7f9GCUzYGu7Tvat2Vkc_LikR0JQfHhN1wSVzR-eVSn8jX0eo7xSLDS0oweV6A1pLwf",
        secretKey: "EHH7oW31NzaIlKpSLSuRMgLiyJPhSXY4zXPynvzrRygrhKEzXC2URjuSSvsbi6wL3-V7f2F8Z4H0RbNK",
        transactions: [
          {
            "amount": {
              "total": myWorkshop.cost.toStringAsFixed(2),
              "currency": "EUR",
              "details": {
                "subtotal": myWorkshop.cost.toStringAsFixed(2),
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
                  "price": myWorkshop.cost.toStringAsFixed(2),
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
                content: Text("Paiement réussi ! 🎉 Vous êtes inscrit.")),
          );

          await FirebaseFirestore.instance.collection('payments').add({
            'userId': FirebaseAuth.instance.currentUser?.uid,
            'workshop': myWorkshop.theme,
            'amount': myWorkshop.cost,
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
}

