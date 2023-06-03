import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Pagina de Tarjetas", selectionColor :Colors.blue)),
      floatingActionButton: FloatingActionButton
      (
        child: const Icon(Icons.arrow_back_rounded),
        onPressed: (){Navigator.pop(context);},
      ),

      body: ListView
      (
        padding: const EdgeInsets.all(15.0),
        children: 
        [
          
          _cardtipo1(),
          _cardtipo2(),
          const SizedBox(height: 30.0),
          _cardtipo1(),
          _cardtipo2(),
          const SizedBox(height: 30.0),
          _cardtipo1(),
          _cardtipo2(),
          const SizedBox(height: 30.0),
          _cardtipo1(),
          _cardtipo2()
        ],
      ),

    );
    
  }
  
  Widget _cardtipo1() 
  {
      return Card
      (
        elevation: 3.0,
        //Bordes
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column
        (
          children: 
           [
            const ListTile
            (
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              leading: Icon(Icons.photo_album,color: Colors.blue),
              title: Text("Trajeta 1"),
              subtitle: Text("Esta sera la primera tarjeta que estamos creando en fltter, para mostrar lo que vamos a ver"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:
            [
              TextButton(onPressed: (){}, child: const Text("Cancelar")),
              TextButton(onPressed: (){}, child: const Text("ok"))
            ]
            ),
            
          ],
        ),
      );
  }
  
  Widget _cardtipo2() 
  {
    
    //(No funciona)const ClipRect(clipBehavior: Clip.antiAlias);
    return Card
    (
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,elevation: 3.0,
      child: Column(children: 
      [
         const FadeInImage
        (
          
          placeholder:AssetImage("assets/jar-loading.gif") , 
          image: NetworkImage("https://cdn.theatlantic.com/media/img/photo/2021/11/winners-2021-natural-landscape-phot/a02_proy_539__5138/main_1500.jpg"),
          fadeOutDuration: Duration(milliseconds: 200),
          height: 300.0,
          fit: BoxFit.cover, 
        ),

         /*Image(image: NetworkImage("https://cdn.theatlantic.com/media/img/photo/2021/11/winners-2021-natural-landscape-phot/a02_proy_539__5138/main_1500.jpg")),*/

        Container
        (
          padding: const EdgeInsets.all(20.0),
          child: const Text("API Generada")
        )

      ]),
    );
  }
  
}