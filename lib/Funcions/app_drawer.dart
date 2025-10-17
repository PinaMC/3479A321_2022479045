import 'package:flutter/material.dart';
import '../pages/my_home_page.dart';
//import '../pages/pixel_Art_screen.dart';
import '../pages/configuracion_screen.dart';
import '../pages/list_creation.dart';
import '../pages/about.dart';
import 'package:google_fonts/google_fonts.dart';

// Drawer reutilizable para todas las pantallas
Drawer buildAppDrawer(BuildContext context, {required String current}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menú',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: '2022479045')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.create),
              title: const Text('Lista de Pixel Art'),
              onTap: () {
                Navigator.pop(context);
              },
              selected: true,
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Mis Creaciones'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ListCreationScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },              
            ), 
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfigurationScreen()),
            );
          },
        ),
      ],
    ),
  );
}