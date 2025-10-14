import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: Colors.white,
      child: LayoutBuilder(builder:
       (context, constraints){
            final isLarge = constraints.maxWidth > 500;
            final scale = isLarge ? 1.5 : 1.0;
      
        return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/logo.png', height: 50 * scale),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Text(
            textAlign: TextAlign.center,
            'Afrodance Corner',
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 20 * scale,
              fontWeight: FontWeight.bold,
              fontFamily: "Arial",
            ),
          )]),
          Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 500) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     IconButton(
                      hoverColor: Colors.deepOrange.shade200,
                  onPressed: () => context.go('/login'),
                  icon: const Icon(Icons.login, color: Colors.black),
                 
                ),
                const SizedBox(width: 30),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.deepOrange.shade200;
                          }
                          return Colors.transparent;
                        },
                      ),
                      ),
                      onPressed: () => context.go('/'),
                      child: const Text(
                        'Accueil', 
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                       style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.deepOrange.shade200;
                          }
                          return Colors.transparent;
                        },
                      ),
                      ),
                      onPressed: () => context.go('/workshop'),
                      child: const Text(
                        'Workshop',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                       style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.deepOrange.shade200;
                          }
                          return Colors.transparent;
                        },
                      ),
                      ),
                      onPressed: () => context.go('/about_us'),
                      child: const Text(
                        'À Propos',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.deepOrange.shade200;
                            }
                            return Colors.transparent;
                          },
                        ),
                        ),
                      onPressed: () => context.go('/contact'),
                      child: const Text(
                        'Contact',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ); // Return an empty container for small screens
              } 
              else {
                // Petit écran : bouton menu
                return PopupMenuButton(
                  icon: const Icon(Icons.menu, color: Colors.orange),
                  itemBuilder: (context) => [
                    PopupMenuItem(child: ListTile(title: const Text('Login'), leading: const Icon(Icons.login, color: Colors.black), onTap: () => context.go('/login'))),
                    PopupMenuItem(child: ListTile(title: const Text('Accueil'), leading: const Icon(Icons.home, color: Colors.black), onTap: () => context.go('/'))),
                    PopupMenuItem(child: ListTile(title: const Text('Workshop'), leading: const Icon(Icons.class_sharp, color: Colors.black), onTap: () => context.go('/workshop'))),
                    PopupMenuItem(child: ListTile(title: const Text('À Propos'), leading: const Icon(Icons.info, color: Colors.black), onTap: () => context.go('/about_us'))),
                    PopupMenuItem(child: ListTile(title: const Text('Contact'), leading: const Icon(Icons.contact_mail, color: Colors.black), onTap: () => context.go('/contact'))),
                  ],
                );
              }
            },
          ),
         ),
        ],
      );
      }
      
    ));
  }
}
