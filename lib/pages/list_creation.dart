import 'package:flutter/material.dart';

//codigo para poder mostrar las 
//creaciones ya realizadas.

class ListCreationScreen extends StatelessWidget {
  const ListCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Creaciones'),
      ),
      body: const Center(
        child: Text(
          'creaciones realizadas',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
