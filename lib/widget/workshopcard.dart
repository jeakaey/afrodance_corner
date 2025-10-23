import 'package:flutter/material.dart';
import 'package:afrodance_corner/views/workshop/workshop.dart';
import 'package:afrodance_corner/widget/suscribe_button.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:afrodance_corner/l10n/app_localizations.dart';

class WorkshopCard extends StatefulWidget {
  final double width;
  final Workshop myWorkshop;

  const WorkshopCard({
    super.key,
    required this.width,
    required this.myWorkshop,
  });

  @override
  State<WorkshopCard> createState() => WorkshopCardState();
}

class WorkshopCardState extends State<WorkshopCard> {
  bool _acceptedMediaConsent = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      elevation: 6,
      shadowColor: Colors.deepOrangeAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: widget.width,
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
                  widget.myWorkshop.theme,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // Infos du workshop
            _infoLine(Icons.calendar_today, widget.myWorkshop.date),
            _infoLine(Icons.access_time, widget.myWorkshop.time),
            _infoLine(Icons.place, widget.myWorkshop.place),
            _infoLine(
              Icons.calendar_today_outlined,
              widget.myWorkshop.dateLine,
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            // Checkbox consentement
            CheckboxListTile(
              value: _acceptedMediaConsent,
              onChanged: (value) {
                setState(() {
                  _acceptedMediaConsent = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.green,
              title: Text(
                l10n.workshopCardAgreementText,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(height: 5),

            // Checkbox consentement
            CheckboxListTile(
              value: _acceptedMediaConsent,
              onChanged: (value) {
                setState(() {
                  _acceptedMediaConsent = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.green,
              title: Text(
                l10n.workshopCardPaymentAgreementText,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            // Forfaits
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // _planCard("Basic", ["Accès au workshop", "Eau + friandises"], "5 EUR", "5.0", _acceptedMediaConsent, context),
                // _planCard("Standard", ["Basic", "Photos + vidéos"], "10 EUR", "10.0", _acceptedMediaConsent, context),
                // _planCard("Premium", ["Standard", "Cadeau spécial"], "15 EUR", "15.0", _acceptedMediaConsent, context),
                _planCard(
                  "Basic",
                  [
                    l10n.workshopCardBasicCriteria1,
                    l10n.workshopCardBasicCriteria2,
                  ],
                  "5 EUR",
                  "5.0",
                  _acceptedMediaConsent,
                  context,
                ),
                _planCard(
                  "Standard",
                  [
                    l10n.workshopCardStandardCriteria1,
                    l10n.workshopCardStandardCriteria2,
                  ],
                  "10 EUR",
                  "10.0",
                  _acceptedMediaConsent,
                  context,
                ),
                _planCard(
                  "Premium",
                  [
                    l10n.workshopCardPremiumCriteria1,
                    l10n.workshopCardPremiumCriteria2,
                  ],
                  "15 EUR",
                  "15.0",
                  _acceptedMediaConsent,
                  context,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- internal Widgets  ---

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
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _planCard(
    String title,
    List<String> features,
    String price,
    String amount,
    bool isChecked,
    BuildContext context,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: 5),
        for (var f in features)
          Text(
            "- $f",
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        const SizedBox(height: 5),
        Text(
          price,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        suscribeButton(widget.myWorkshop, amount, isChecked, context),
      ],
    );
  }
}
