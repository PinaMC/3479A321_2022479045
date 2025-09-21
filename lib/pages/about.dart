import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'list_art.dart';
import 'list_creation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("AboutScreen cargada"); // mensaje de about screen cargada
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
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
              },
              selected: true, // Esta es la pantalla actual
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App de Pixel Art',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Desarrollado por: Vicente Farías Piña\n'
              'Matrícula: 2022479045\n'
              'Institución: Universidad de Talca\n'
              'Curso: Dispositivos Móviles\n'
              'Profesor: Manuel Moscoso\n'
              'Esta aplicación permite crear y guardar pixel art de manera sencilla.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}