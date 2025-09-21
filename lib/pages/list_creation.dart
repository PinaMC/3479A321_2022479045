import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'list_art.dart';
import 'about.dart';
import 'package:google_fonts/google_fonts.dart';

//pantalla de "Mis Creaciones"
class ListCreationScreen extends StatelessWidget {
  const ListCreationScreen({super.key});

  final List<String> pixelArt = const [
    "assets/Pixel-Art-Pizza-2.webp",
    "assets/Pixel-Art-Hot-Pepper-2-1.webp",
    "assets/Pixel-Art-Watermelon-3.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Creaciones'),
        // Puedes dejar el botón de menú lateral, el Drawer ya lo agrega automáticamente
      ),
      drawer: Drawer( //empieza menu lateral
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ListArtScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Mis Creaciones'),
              onTap: () {
                Navigator.pop(context);
              },
              selected: true, // Esta es la pantalla actual
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
          ],
        ),
      ), //termine el menu lateral,

      // Ahora el contenido es una lista de Cards con imágenes
      body: ListView.builder(
        itemCount: pixelArt.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: SizedBox(
              height: 120,
              child: Image.asset(
                pixelArt[index],
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}