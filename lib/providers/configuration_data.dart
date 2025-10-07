import 'package:flutter/material.dart';

//pantalla para configurar datos
class ConfigurationData extends StatefulWidget {
  const ConfigurationData({super.key});

  @override
  State<ConfigurationData> createState() => _ConfigurationDataState();
}

class _ConfigurationDataState extends State<ConfigurationData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Datos'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: const Center(
        child: Text('Elige el tamaño del Pixel Art'), //eleige entre 16, 18, 20,etc.
      ),
    );
  }
}
class AppData extends ChangeNotifier{
  int _size = 8; //final porque no se va a cambiar?? si cambia con setSize
  int get size => _size;

  void setSize(int newSize){
    _size = newSize;
    notifyListeners(); //notica a los widget que hubo un cambio en este provider
  }
}