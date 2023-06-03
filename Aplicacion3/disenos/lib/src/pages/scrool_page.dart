import 'package:flutter/material.dart';

class ScroolPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: PageView
      (
        scrollDirection: Axis.vertical,
        children: 
        [
          _Pagina1(),
          _pagina2(),
        ],
      )
    );
  }
  
  Widget _Pagina1() 
  {
    return Container(
      child: Stack
      (
        children: 
        [
          _colorFondo(),
          _imagenFondo(),
          _crearTextos()
        ],
      )
      
      );
  }
  
  Widget _pagina2() 
  {
    return Container(
      width: double.infinity,
      height: double.infinity,
       color: const Color.fromRGBO(108,192,218, 1.0),
       child: Center(
         child: ElevatedButton
         (
          onPressed: (){},
          style: ElevatedButton.styleFrom
          (
            shape: const StadiumBorder()
          ), 
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: Text("Bienvenidos", style: TextStyle(fontSize: 25.0),)),    
        ),
       ));
  }
  
  Widget _colorFondo() 
  {
    return Container
    (
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(108,192,218, 1.0),
    );
  }
  

  Widget _imagenFondo() 
  {
    return Container
    (
      width: double.infinity,
      height: double.infinity,
      child: Image(image: AssetImage("assets/img/scroll-1.png"),
      fit: BoxFit.cover,
      ),
      
    
    );
    
  }

final estilo = const TextStyle(color: Colors.white, fontSize: 56);

  Widget _crearTextos() 
  {
    return SafeArea(
      child: Column(children: 
      [
        const SizedBox(height: 20.0,),
        Text("30°", style: estilo),
        Text("Viernes", style: estilo),
        Expanded(child: Container()),
        Container(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: const Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white))
      ]));
  }


}