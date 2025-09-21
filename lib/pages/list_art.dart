import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'list_creation.dart';
import 'about.dart';
import 'package:google_fonts/google_fonts.dart';

class ListArtScreen extends StatelessWidget {
  const ListArtScreen({super.key});

  final List<String> pixelArt = const [
    "assets/Pixel-Art-Pizza-2.webp",
    "assets/Pixel-Art-Hot-Pepper-2-1.webp",
    "assets/Pixel-Art-Watermelon-3.webp",
  ];
  static const List<String> titles = [
    "Pizza",
    "Ají",
    "Sandía",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixel Art List'),
      ),
      drawer: Drawer(
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
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: pixelArt.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    pixelArt[index],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pixelArt[index],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}