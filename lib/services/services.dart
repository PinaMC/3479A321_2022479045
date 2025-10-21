import 'package:shared_preferences/shared_preferences.dart';

// ignore: unused_import
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:flutter/material.dart';


class SharedService {
  //las claves sirven para evitar errores al guardar y cargar datos
  static const String _sizeKey = 'pixel_grid_size'; //clave para tamaño del grid
  static const String _colorKey = 'selected_color'; //clave para color seleccionado
  static const String _gridKey = 'saved_pixel_grid'; //clave para grid guardado
  
  // Guardar el tamaño del grid
  static Future<void> saveGridSize(int size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_sizeKey, size);
  }

  // Cargar el tamaño del grid (con valor por defecto)
  static Future<int> loadGridSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_sizeKey) ?? 16; // 16 como valor por defecto
  }

  // Guardar el color seleccionado
  static Future<void> saveSelectedColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    // ignore: deprecated_member_use
    await prefs.setInt(_colorKey, color.value);
  }

  // Cargar el color seleccionado (con valor por defecto)
  static Future<Color> loadSelectedColor() async {
   final prefs = await SharedPreferences.getInstance();
    // ignore: deprecated_member_use
    final colorValue = prefs.getInt(_colorKey) ?? Colors.black.value;
    return Color(colorValue);
  }

  //Funciones para guardar el grid que hizo el usuario
    // Guardar el grid completo (lista de colores)
  static Future<void> saveGrid(List<Color> gridColors) async {
    final prefs = await SharedPreferences.getInstance();
    // ignore: deprecated_member_use
    final colorValues = gridColors.map((color) => color.value).toList();
    await prefs.setString(_gridKey, jsonEncode(colorValues));
  }

  // Cargar el grid completo
  static Future<List<Color>?> loadGrid(int gridSize) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_gridKey);
    
    if (data == null) {
      // Si no hay datos guardados, devolver grid vacío (transparente)
      return List<Color>.generate(gridSize * gridSize, (_) => Colors.transparent);
    }
    
    final colorValues = List<int>.from(jsonDecode(data));
    return colorValues.map((value) => Color(value)).toList();
  }
}