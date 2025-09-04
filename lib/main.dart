import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
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
  
  Color _decrementColor = const Color.fromRGBO(244, 67, 54, 1);
  Color _incrementColor = const Color.fromRGBO(76, 175, 80, 1);
  Color _restartColor = const Color.fromRGBO(33, 150, 243, 1);
  //Color _changeColor = const Color.fromRGBO(255, 152, 0, 1);
  Color _backgroundColor = Colors.white;

  int colorIndex = 0;
  List<Color> colors = [
    Colors.purple,
    Colors.orange,
    Colors.brown,
    Colors.white,
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
      _incrementColor = Colors.green;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _incrementColor = const Color.fromRGBO(76, 175, 80, 1);
      });
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _decrementColor = Colors.red;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _decrementColor = const Color.fromRGBO(244, 67, 54, 1);
      });
    });
  }

  void _restartCounter() {
    setState(() {
      _counter = 0;
      _restartColor = Colors.blue;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _restartColor = const Color.fromRGBO(33, 150, 243, 1);
      });
    });
  }
  void resetColors() {
    setState(() {
      _decrementColor = const Color.fromRGBO(244, 67, 54, 1);
      _incrementColor = const Color.fromRGBO(76, 175, 80, 1);
      _restartColor = const Color.fromRGBO(33, 150, 243, 1);
      //_changeColor = const Color.fromRGBO(255, 152, 0, 1);
    });
  }
  void changeColor(){
    setState(() {
      _backgroundColor = colors[colorIndex];
      colorIndex = (colorIndex + 1) % colors.length;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: _backgroundColor, //para que cambie el color de fondo
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('“Pixel Art sobre una grilla personalizable"'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _decrementCounter,
            backgroundColor: _decrementColor,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10), // Espacio entre los botones
          FloatingActionButton(
            onPressed: _incrementCounter,
            backgroundColor: _incrementColor,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10), // Espacio entre los botones
          FloatingActionButton(
            onPressed: _restartCounter,
            backgroundColor: _restartColor,
            tooltip: 'Restart',
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 10), // Espacio entre los botones
          FloatingActionButton(
            onPressed: changeColor,
            tooltip: 'ChangeColor',
            child: const Icon(Icons.brush),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
