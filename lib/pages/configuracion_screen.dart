import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/configuration_data.dart';

//pantalla para configurar datos incluyendo un dropdown para elegir tamaño de letra y color
class ConfigurationScreen extends StatefulWidget { //stateful porque va a cambiar según lo que el usuario elija
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
  
}

//funcion para el color
String _getColorName(Color color) {
  if (color == Colors.black) return 'Negro';
  if (color == Colors.purple) return 'Morado';
  if (color == Colors.red) return 'Rojo';
  if (color == Colors.blue) return 'Azul';
  if (color == Colors.green) return 'Verde';
  if (color == Colors.yellow) return 'Amarillo';
  return 'Color';
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
        title: const Text("Configuración Pixel Art"),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(20.0),
        child:      
        Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configuración de los datos predeterminados \n del Pixel Art:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Seleccione el tamaño de los pixeles:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            //DropdownButton para seleccion de tamaño del de pixel art
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                labelText: 'Tamaño de los Pixeles',
                border: OutlineInputBorder(),
              ),

              items: _size.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()), //convierte el int a string
                );
              }).toList(),
                onChanged: (newValue) async{
                  if (newValue != null) {
                    await context.read<ConfigurationData>().setSize(newValue); 
                  }
                },
            ),
            const SizedBox(height: 20),
            const Text(
              'Seleccione el color:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            //dropdown para seleccionar color
            DropdownButtonFormField<Color>( 
              decoration: const InputDecoration(
                labelText: 'Color',
                border: OutlineInputBorder(),
              ),
              items: _colores.map((Color color) { //el .map sirve para transformar cada elemento de la lista en otra cosa
                return DropdownMenuItem<Color>(
                  value: color,
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        color: color,
                      ),
                      const SizedBox(width: 10),
                      Text(_getColorName(color)), //muestra el nombre del color
                    ],
                  )
                );
              }).toList(),  //to list sirve para convertir el iterable en una lista
              onChanged: (newColor) {//Lógica del cambio de color

                if(newColor != null){
                  setState(() {
                    selectedColor = newColor;
                  });
                  context.read<ConfigurationData>().setColor(newColor);
                }
              },
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Mostrar números en celdas'),
              subtitle: const Text('Mostrar/ocultar índices en el grid'),
              value: context.watch<ConfigurationData>().showNumbers,
              onChanged: (bool value) {
                context.read<ConfigurationData>().setShowNumbers(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

