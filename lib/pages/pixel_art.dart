import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../providers/configuration_data.dart';

class PixelArt extends StatefulWidget { 
  const PixelArt({super.key}); 
 
  @override 
  PixelArtState createState() => PixelArtState(); 
} 
 
class PixelArtState extends State<PixelArt> { 
  Logger logger = Logger(); 
  int _sizeGrid = 16; 
  Color _selectedColor = Colors.black; 
 
  final List<Color> _listColors = [ 
    Colors.black, 
    Colors.white, 
    Colors.red, 
    Colors.orange, 
    Colors.yellow, 
    Colors.green, 
    Colors.blue, 
    Colors.indigo, 
    Colors.purple, 
    Colors.brown, 
    Colors.grey, 
    Colors.pink, 
  ]; 
 
  // Usamos late porque se inicializa después
  late List<Color> _cellColors;
  @override 
  void initState() { 

    super.initState(); 
    _sizeGrid = context.read<ConfigurationData>().size; 
    // Inicializamos el grid con el tamaño correcto
    _cellColors = List<Color>.generate(
      _sizeGrid * _sizeGrid, 
      (index) => Colors.transparent,
    );
    logger.d("Grid size set to: $_sizeGrid"); 
  } 
 
  @override 
  void didChangeDependencies() { 
    super.didChangeDependencies(); 
    
    // Obtenemos el nuevo tamaño del provider
    final newSize = context.watch<ConfigurationData>().size; 
    
    // Solo regeneramos si el tamaño cambió
    if (newSize != _sizeGrid) {
      setState(() {
        _sizeGrid = newSize;
        // Regeneramos el grid con el nuevo tamaño
        _cellColors = List<Color>.generate(
          _sizeGrid * _sizeGrid, 
          (index) => Colors.transparent,
        );
      });
      logger.d("Grid regenerated with new size: $_sizeGrid");
    }
    
    logger.d("Dependencies changed in PixelArt. Mounted: $mounted"); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Creation Process'),  
      ), 
      body: SafeArea(
        child: Column( 
          children: [ 
            Padding( 
              padding: const EdgeInsets.all(8.0), 
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [ 
                  Text('$_sizeGrid x $_sizeGrid'), 
                  const SizedBox(width: 8), 
                  Expanded( 
                    child: Padding( 
                      padding: const EdgeInsets.symmetric(horizontal: 8.0), 
                      child: TextField( 
                        decoration: const InputDecoration( 
                          hintText: 'Enter title', 
                          border: OutlineInputBorder(), 
                        ), 
                        onSubmitted: (value) { 
                          logger.d('Title entered: $value'); 
                        }, 
                      ), 
                    ), 
                  ), 
                  ElevatedButton( 
                    onPressed: () { 
                      logger.d('Button pressed'); 
                    }, 
                    child: const Text('Submit'), 
                  ), 
                ], 
              ), 
            ), 
            
            // GridView del pixel art
            Expanded( 
              child: GridView.builder( 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
                  crossAxisCount: _sizeGrid, 
                ), 
                itemCount: _sizeGrid * _sizeGrid, 
                itemBuilder: (context, index) { 
                  return GestureDetector( 
                    onTap: () { 
                      setState(() { 
                        _cellColors[index] = _selectedColor; 
                      }); 
                    }, 
                    child: Container( 
                      margin: const EdgeInsets.all(1), 
                      color: _cellColors[index], 
                      child: Center( 
                        // ⭐ AQUÍ está la funcionalidad de mostrar/ocultar números
                        child: context.watch<ConfigurationData>().showNumbers
                            ? Text( 
                                '$index', 
                                style: TextStyle( 
                                  color: _cellColors[index] == Colors.black 
                                      ? Colors.white 
                                      : Colors.black,
                                  fontSize: 10, // Ajusta según necesites
                                ), 
                              )
                            : null, // No muestra nada si showNumbers es false
                      ), 
                    ), 
                  ); 
                }, 
              ), 
            ), 
            
            // Footer con paleta de colores
            Container( 
              padding: const EdgeInsets.symmetric(vertical: 8), 
              color: Colors.grey[200], 
              child: SingleChildScrollView( 
                scrollDirection: Axis.horizontal, 
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: _listColors.map((color) { 
                    final bool isSelected = color == _selectedColor; 
                    return GestureDetector( 
                      onTap: () { 
                        setState(() { 
                          _selectedColor = color; 
                        }); 
                      }, 
                      child: AnimatedContainer( 
                        duration: const Duration(milliseconds: 200), 
                        margin: const EdgeInsets.symmetric(horizontal: 4), 
                        padding: EdgeInsets.all(isSelected ? 12 : 8), 
                        decoration: BoxDecoration( 
                          color: color, 
                          shape: BoxShape.circle, 
                          border: isSelected 
                              ? Border.all(color: Colors.black, width: 2) 
                              : null, 
                        ), 
                        width: isSelected ? 36 : 28, 
                        height: isSelected ? 36 : 28, 
                      ), 
                    ); 
                  }).toList(), 
                ), 
              ),  
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
}