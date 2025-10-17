import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//pantalla para configurar datos
class ConfigurationData extends ChangeNotifier {
    var logger = Logger();
    
  int _size = 12; //Se cambia el valor con setSize
  //colores
  Color _selectedColor = Colors.red; //color seleccionado por defecto

  int get size => _size;
  Color get selectedColor => _selectedColor;

  void setSize(int newSize){  //funcion para cambiar tamaño
    logger.d("Cambiando tamaño a $_size a $newSize"); //se muestra ek cambio en debug
    _size = newSize;
    notifyListeners(); 
  }  
  void setColor(Color newColor){  //funcion para cambiar color
  logger.d("Cambiando color de $_selectedColor a $newColor"); //se muestra ek cambio en debug
    _selectedColor = newColor;
    notifyListeners(); 
  }
  
}


/*notifyListners: notica a los widget que hubo un cambio en este provider
//ChangeNotifier: Guarda datos y avisa si algo cambia.
//Provider: Hace que esos datos estén disponibles en toda la app.
*/


