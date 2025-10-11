import 'package:flutter/material.dart';
import 'package:afrodance_corner/views/workshop/workshop.dart';
import 'package:afrodance_corner/widget/suscribe_button.dart';
class WorkshopCard extends StatelessWidget {
  final double width;
 // final VoidCallback onPressed;
  final Workshop myWorkshop;

  const WorkshopCard({
    super.key,
    required this.width,
   // required this.onPressed,
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
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // Infos du workshop
            _infoLine(Icons.calendar_today, myWorkshop.date),
            _infoLine(Icons.access_time, myWorkshop.time),
            _infoLine(Icons.place, myWorkshop.place),
            _infoLine(Icons.calendar_today_outlined, myWorkshop.dateLine),
            const SizedBox(height: 20),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                     Text("Basic", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                     color: Colors.deepOrange),),
                     SizedBox(height: 5),
                     Text("- Accès au workshop", style: TextStyle(fontSize: 12, color: Colors.black),),
                     Text("- Eau + friandises ", style: TextStyle(fontSize: 12, color: Colors.black),),
                     SizedBox(height: 5),
                     Text("5 EUR", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),), 
                     suscribeButton(myWorkshop, context, 5.0)
                  ],
                ),
                Column(
                  children: [
                     Text("Standard", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                     color: Colors.deepOrange),),
                     SizedBox(height: 5),
                     Text("- Basic ", style: TextStyle(fontSize: 12, color: Colors.black),),
                     Text("- Photos + videos ", style: TextStyle(fontSize: 12, color: Colors.black),),
                     SizedBox(height: 5),
                     Text("10 EUR", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                     SizedBox(height: 5),
                     suscribeButton(myWorkshop, context, 10.0)
                  ],),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                     Text("Premium", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                     color: Colors.deepOrange),),
                     SizedBox(height: 5),
                     Text("- Standard", style: TextStyle(fontSize: 12, color: Colors.black),),
                     Text("- Cadeau special", style: TextStyle(fontSize: 12, color: Colors.black),),
                     SizedBox(height: 5),
                     Text("15 EUR", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                     SizedBox(height: 5),
                     suscribeButton(myWorkshop, context, 15.0)
                  ],
                )
              ],
            )
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

  
}

