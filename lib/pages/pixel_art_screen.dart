import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//Código para mantener información de una pantalla a otra
//En la cual se realizará la creación de los pixel art
//// a través de la clase PixelArtScreen. 
class PixelArtScreen extends StatefulWidget {
  const PixelArtScreen({super.key, required this.title});
  final String title;

  @override
  State<PixelArtScreen> createState() => _PixelArtScreenState();
}

class _PixelArtScreenState extends State<PixelArtScreen> {

  var logger = Logger();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.d("In initState method of _PixelArtScreenState");
      }  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    logger.d("In didChanges method of _PixelArtScreenState");
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    logger.d("In setState method of _PixelArtScreenState");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    logger.d("In deactivate method of _PixelArtScreenState");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    logger.d("In dispose method of _PixelArtScreenState");
  }

  @override
  void reassemble() { //este metodo sirve para hot reload
    // TODO: implement reassemble
    super.reassemble();
    logger.d("In reassemble method of _PixelArtScreenState");
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
      body: const Center(
        child: Text(
          'Pixel Art Creation Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
  @override
  void didUpdateWidget(covariant PixelArtScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    logger.d("In didUpdateWidget method of _PixelArtScreenState");
  } 
}

