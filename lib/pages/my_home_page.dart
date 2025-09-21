import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'about.dart';
import 'list_art.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_creation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Lista de colores
  int colorIndex = 0;
  List<Color> colors = [
    Colors.purple,
    Colors.orange,
    Colors.brown,
    Colors.white,
  ];
  // Variable para cambiar color
  Color changeColorButtonColor = Colors.purple;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _restartCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _changeColors() {
    setState(() {
      colorIndex = (colorIndex + 1) % colors.length; // Cambiar colores en la lista
      changeColorButtonColor = colors[colorIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working! in build method of _MyHomePageState");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                Navigator.pop(context); // Solo cierra el Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.create),
              title: const Text('Lista de Pixel Art'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer primero
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListArtScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Mis Creaciones'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer primero
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListCreationScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer primero
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('“Pixel Art sobre una grilla personalizable"'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Puedes descomentar esto si quieres mostrar imágenes
            /*
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset('assets/Pixel-Art-Hot-Pepper-2-1.webp', width: 200, height: 200),
                  SizedBox(width: 10),
                  Image.asset('assets/Pixel-Art-Pizza-2.webp', width: 200, height: 200),
                  SizedBox(width: 10),
                  Image.asset('assets/Pixel-Art-Watermelon-3.webp', width: 200, height: 200),
                  SizedBox(width: 10),
                ],
              ),
            ),
            */
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: null,
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: null,
            onPressed: _restartCounter,
            tooltip: 'Restart',
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: null,
            onPressed: _changeColors,
            backgroundColor: changeColorButtonColor,
            tooltip: 'ChangeColor',
            child: const Icon(Icons.brush),
          ),
        ],
      ),
    );
  }
}