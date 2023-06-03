import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Pagina de avatares"),
        actions: 
        [
          //Xreamos el abatar con el background de imagen
          Container(
            margin  : const EdgeInsets.only(right: 5.0 ),
            child   : const CircleAvatar(backgroundImage: NetworkImage("https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector.png"),


          )),
          //creamos el avatar del texto
          Container
          (
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(backgroundColor:Colors.red, child: Text("CV")),
          )
        ],
      ),

      body: ListView(children:[Center(child: Column(children:
       [
        const Card
        (
          elevation: 3.0,
          child: ListTile(
            title: Text("Galeria"),
            subtitle: Text("Fotos únicas"),
          
          )),
          const SizedBox(height: 10),
        
        //Primera tarjeta
        Card 
          (
            clipBehavior: Clip.antiAlias,
            shape       : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child       : Column(
              children:const  [
                ListTile(title: Text("Primera imagen")),
                FadeInImage(
                placeholder : AssetImage("assets/jar-loading.gif"), 
                image       : NetworkImage("https://img.freepik.com/fotos-premium/posesion-aleatoria-monstruos-mas-detallado-colorido-brutal-2_811077-4.jpg?w=2000")
                ),       
              ],
            )
          ),
          const SizedBox(height: 20),
          //Segunda tarjeta
          Card 
          (
            clipBehavior: Clip.antiAlias,
            shape       : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child       : Column(
              children:const  [
                ListTile(title: Text("Segunda imagen")),
                FadeInImage(
                placeholder : AssetImage("assets/jar-loading.gif"), 
                image       : NetworkImage("https://i0.wp.com/hotbook.mx/wp-content/uploads/2018/08/drone-photos-3.jpg?fit=800%2C551&ssl=1")
                ),       
              ],
            )
          ),
          
          const SizedBox(height: 20),
          //Tercera tarjeta
          Card 
          (
            clipBehavior: Clip.antiAlias,
            shape       : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child       : Column(
              children:const  [
                ListTile(title: Text("Tercera imagen")),
                FadeInImage(
                placeholder : AssetImage("assets/jar-loading.gif"), 
                image       : NetworkImage("https://www.tuexperto.com/wp-content/uploads/2016/03/matt-molloy-time-stacks-designboom-02.jpg")
                ),       
              ],
            )
          ),

          const SizedBox(height: 20),
          //Cuarta tarjeta
          Card 
          (
            clipBehavior: Clip.antiAlias,
            shape       : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child       : Column(
              children:const  [
                ListTile(title: Text("Cuarta imagen")),
                FadeInImage(
                placeholder : AssetImage("assets/jar-loading.gif"), 
                image       : NetworkImage("https://www.enaranda.es/wp-content/uploads/2020/06/espacio-3-923x1024.jpg")
                ),       
              ],
            )
          )
          
      ])
      ),]),

      floatingActionButton: FloatingActionButton
      (
        child:const Icon(Icons.arrow_back_rounded),
        onPressed:(){Navigator.pop(context);} 
      ),

    );
  }
}