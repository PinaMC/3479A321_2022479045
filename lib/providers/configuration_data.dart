// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../services/services.dart';
//import 'package:shared_preferences/shared_preferences.dart';

//Archivo para configurar datos
class ConfigurationData extends ChangeNotifier {
  
  var logger = Logger();
  final SharedService _prefsService;
  
  int _size = 16; //Se cambia el valor con setSize
  Color _selectedColor = Colors.red; //color seleccionado por defecto
  

  bool _isInitialized = false;

  ConfigurationData(this._prefsService) {
    _loadpreferences();
  }

  int get size => _size;
  Color get selectedColor => _selectedColor;
  bool get isInitialized => _isInitialized;

  Future<void> _loadpreferences() async { //async sirve para esperar a que se carguen los datos
    _size = await SharedService.loadGridSize();   //await sirve para esperar a que se carguen los datos
    _selectedColor = await SharedService.loadSelectedColor();
    _isInitialized = true;
    notifyListeners(); // Notificar que los datos han sido cargados
  }

  void setSize(int newSize){  //funcion para cambiar tamaño
    logger.d("Cambiando tamaño a $_size a $newSize"); //se muestra ek cambio en debug
    SharedService.saveGridSize(newSize); //guardar tamaño en preferencias
    _size = newSize;
    notifyListeners(); 
  }  

  void setColor(Color newColor) async{  //funcion para cambiar color
  logger.d("Cambiando color de $_selectedColor a $newColor"); //se muestra ek cambio en debug
    _selectedColor = newColor;
    await SharedService.saveSelectedColor(newColor); //guardar color en preferencias
    notifyListeners(); 
  } 
}
/*notifyListners: notica a los widget que hubo un cambio en este provider
//ChangeNotifier: Guarda datos y avisa si algo cambia.
//Provider: Hace que esos datos estén disponibles en toda la app.
*/