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
  bool _showNumbers = true; // Nueva variable

  bool get showNumbers => _showNumbers;


  ConfigurationData(this._prefsService) {
    _loadpreferences();
  }

  int get size => _size;
  Color get selectedColor => _selectedColor;
  bool get isInitialized => _isInitialized;

  Future<void> _loadpreferences() async {
    _size = await _prefsService.loadGridSize();       
    _selectedColor = await _prefsService.loadSelectedColor();  
    _showNumbers = await _prefsService.loadShowNumbers(); 
    logger.d("Preferences loaded: size=$_size, color=$_selectedColor, showNumbers=$_showNumbers");
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> setSize(int newSize) async {  
    logger.d("Cambiando tamaño a $_size a $newSize");
    _size = newSize;
    await _prefsService.saveGridSize(newSize);  
    notifyListeners();
  }

  Future<void> setColor(Color newColor) async {
    logger.d("Cambiando color de $_selectedColor a $newColor");
    _selectedColor = newColor;
    await _prefsService.saveSelectedColor(newColor);  
    notifyListeners();
  }
  
  // Función para actualizar showNumbers
  Future<void> setShowNumbers(bool show) async {
    _showNumbers = show;
    await _prefsService.saveShowNumbers(show);
    notifyListeners();
  }
}

/*notifyListners: notica a los widget que hubo un cambio en este provider
//ChangeNotifier: Guarda datos y avisa si algo cambia.
//Provider: Hace que esos datos estén disponibles en toda la app.
*/