import 'package:flutter/material.dart';



class BasicoPage extends StatelessWidget {
   const BasicoPage({super.key});

final estilotitulo = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
final estiloSubtitulo = const TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: SingleChildScrollView(
        child: Column
        (
         children: 
         [
          _crearImagen(),       
          _construirFila(),
          const SizedBox(height: 5.0,),
          _construirFila2(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
         ],
        ),
          
      )
    );
  }
  Widget _crearImagen()
  {
    return Container(
      width: double.infinity,
      height: 250,
      child: const FadeInImage
          (
            placeholder: AssetImage("assets/img/loading.gif"), 
            image: NetworkImage("https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067__340.png"),
            fit: BoxFit.cover,
          ),
    );
  }
  
 Widget _construirFila() 
  {
    //El safe area determina donde se puede poner informacion
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row
        (
          children: 
          [
            Expanded(
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  Text("Atardecer en las montañas", style: estilotitulo,),
                  const SizedBox(height: 7.0),
                  Text("Creado con inteligencia artificial", style: estiloSubtitulo,)
                ],
              ),
            ),
            const Icon(Icons.star, color: Colors.red,size: 30.0,),
            const Text("41", style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }
  
 Widget _construirFila2() 
 {
  return Row
  (
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: 
    [
      _acccion(Icons.call,"CALL"),
      _acccion(Icons.near_me, "ROUTE"),
      _acccion(Icons.search,"SEARCH"),
      
    ],
  );
 }
 
  Widget _acccion(IconData icono, String texto) 
  {
    return Column
      (
        children: 
        [
           Icon(icono, color: Colors.blue,size: 40.0,),
           SizedBox(height: 5.0),
           Text(texto,style: TextStyle(fontSize: 15.0, color: Colors.blue),)
        ],
      );
  }

Widget _crearTexto()
{
  return SafeArea(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: const Text("Los atardeceres de montañas son uno de los espectáculos naturales más impresionantes que se pueden presenciar. La combinación de la belleza natural de la montaña con los intensos colores del cielo al atardecer crea una experiencia visual única.", textAlign: TextAlign.justify,style: TextStyle(height: 1.5, fontSize: 15),)),
  );
}

}