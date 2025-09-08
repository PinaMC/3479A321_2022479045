//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var logger = Logger();
    logger.d("Logger is working! in build method of MyApp"); // se supone que sale al inicio
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: '2022479045'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    var logger = Logger();
    logger.d("Logger is working! in build method of _MyHomePageState");
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          //how
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('“Pixel Art sobre una grilla personalizable"'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            //se muestran imagenes en fila y se puede scrollear
            /*
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset('Assets/Pixel-Art-Hot-Pepper-2-1.webp', width: 200, height: 200),
                  Image.asset('Assets/Pixel-Art-Pizza-2.webp', width: 200, height: 200),
                  Image.asset('Assets/Pixel-Art-Watermelon-3.webp', width: 200, height: 200),
                ],
              ),
            ),*/
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
