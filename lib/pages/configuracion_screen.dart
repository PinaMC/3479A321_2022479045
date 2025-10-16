import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/configuration_data.dart';

//pantalla para configurar datos incluyendo un dropdown para elegir tamaño de letra y color
class ConfigurationScreen extends StatefulWidget { //stateful porque va a cambiar según lo que el usuario elija
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
  
}

class _ConfigurationScreenState extends State<ConfigurationScreen> { 
  
  //signo de pregunta porque puede ser nulo al inicio
  int? slectedSize; //variable para guardar el tamaño seleccionado
  Color? selectedColor; // variable para guardar el color seleccionado

  final List<int> _size = [12, 16, 18, 20, 24, 28]; //lista de tamaños de letra
  final List<Color> _colores = [Colors.black, Colors.purple, Colors.red, Colors.blue,
   Colors.green, Colors.yellow];//lista de colores
   

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(20.0),
        child:      
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configuración de los datos predeterminados \n del proyecto:',
            ),
            const SizedBox(height: 30),
            //DropdownButton para seleccion de tamaño del de pixel art
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                labelText: 'Tamaño de letra',
                border: OutlineInputBorder(),
              ),
              items: _size.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()), //convierte el int a string
                );
              }).toList(),
              onChanged: (newValue) { // Lógica del cambio de tamaño de letra
                if (newValue != null) {
                  Provider.of<ConfigurationData>(context, listen: false).setSize(newValue);
                }
                
              },
            ),
            const SizedBox(height: 20),
            //dropdown para seleccionar color
            DropdownButtonFormField<Color>( 
              decoration: const InputDecoration(
                labelText: 'Color',
                border: OutlineInputBorder(),
              ),
              items: _colores.map((Color color) { //el .map sirve para transformar cada elemento de la lista en otra cosa
                return DropdownMenuItem<Color>(
                  value: color,
                  child: Container(
                    width: 100,
                    height: 20,
                    color: color,
                  ),
                );
              }).toList(),  //to list sirve para convertir el iterable en una lista
              onChanged: (newColor) {//Lógica del cambio de color

                if(selectedColor != null){
                  Provider.of<ConfigurationData>(context, listen: false).setColor(newColor!);

                }

              },
            ),
          ],
        ),
      ),
    );
  }
}

