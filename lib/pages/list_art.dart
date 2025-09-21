import 'package:flutter/material.dart';


//codigo para poder mostrar la lista de pixel art 
//disponibles para realizar. 

class ListArtScreen extends StatelessWidget {
  const ListArtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixel Art List'),
      ),
      body: const Center(
        child: Text(
          'Lista de pixel art disponibles',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

