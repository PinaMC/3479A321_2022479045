import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  //lista de colores
  int colorIndex = 0;
  List<Color> colors = [
    Colors.purple,
    Colors.orange,
    Colors.brown,
    Colors.white,
  ];
  //variable para cambiar color
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
    colorIndex = (colorIndex + 1) % colors.length; //cambiar colores en la lista
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('“Pixel Art sobre una grilla personalizable"'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            //se muestran imagenes en fila y se puede scrollear
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset('assets/Pixel-Art-Hot-Pepper-2-1.webp', width: 200, height: 200),
                  SizedBox(width: 10), // Espacio entre las imagenes
                  Image.asset('assets/Pixel-Art-Pizza-2.webp', width: 200, height: 200),
                  SizedBox(width: 10), // Espacio entre las imagenes
                  Image.asset('assets/Pixel-Art-Watermelon-3.webp', width: 200, height: 200),
                  SizedBox(width: 10), // Espacio entre las imagenes
                ],
              ),
            ),
          ],
        ),
      ),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),

          const SizedBox(width: 10), // Espacio entre los botones
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          const SizedBox(width: 10), // Espacio entre los botones
          FloatingActionButton(
            onPressed: _restartCounter,
            tooltip: 'Restart',
            child: const Icon(Icons.refresh),
          ),
          
          const SizedBox(width: 10), // Espacio entre los botones
          FloatingActionButton(
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

