//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_lab_vicentefarias/providers/configuration_data.dart';
import 'package:logger/logger.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_lab_vicentefarias/pages/my_home_page.dart';


void main() {
  runApp(const MyApp());
  ChangeNotifierProvider(
    create: (context) => AppData(),
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("*MAIN* Logger is working!"); // se supone que sale al inicio
    
    return ChangeNotifierProvider<AppData>(
  create: (context) => AppData(),
  child: MaterialApp(
    title: '2022479045',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      useMaterial3: true,
    ),
    home: const MyHomePage(title: '2022479045'),
  ),
);

  }
}