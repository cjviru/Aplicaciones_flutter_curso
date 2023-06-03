import 'dart:math';

import 'package:flutter/material.dart';

class AnimacionPage extends StatefulWidget {
  

  @override
  State<AnimacionPage> createState() => _AnimacionPageState();
}

class _AnimacionPageState extends State<AnimacionPage> {
  
  double _ancho = 50.0;
  double _alto  = 50.0;
  Color _color  = Colors.pink;
  BorderRadiusGeometry _borde = BorderRadius.circular(8.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Pagina de animacion"),),

      body: Center(child: 
      AnimatedContainer( 
          width: _ancho,
          height: _alto,
          decoration: BoxDecoration(borderRadius: _borde, color: _color),
          duration:const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
      ),),
      
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_outline),
        onPressed: ()=> aleatorio()
              
        ),
        
    );
  }
  
  void aleatorio() 
  {
    final ramdon = Random();
    setState(() 
    {     _ancho        = ramdon.nextInt(400).toDouble();
          _alto         = ramdon.nextInt(400).toDouble();
          _color        = Color.fromRGBO(ramdon.nextInt(255), ramdon.nextInt(255), ramdon.nextInt(255), 1);  
          _borde        = BorderRadius.circular(ramdon.nextInt(100).toDouble());

    });
  }
}