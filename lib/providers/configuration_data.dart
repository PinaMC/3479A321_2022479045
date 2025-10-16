import 'package:flutter/material.dart';

//pantalla para configurar datos
class ConfigurationData extends ChangeNotifier {
  int _size = 12; //Se cambia el valor con setSize
  //colores
  Color _selectedColor = Colors.red; //color seleccionado por defecto

  int get size => _size;
  Color get selectedColor => _selectedColor;

  void setSize(int newSize){  //funcion para cambiar tamaño
    _size = newSize;
    notifyListeners(); 
  }  
  void setColor(Color newColor){  //funcion para cambiar color
    _selectedColor = newColor;
    notifyListeners(); 
  }
  
}


/*notifyListners: notica a los widget que hubo un cambio en este provider
//ChangeNotifier: Guarda datos y avisa si algo cambia.
//Provider: Hace que esos datos estén disponibles en toda la app.
*/


