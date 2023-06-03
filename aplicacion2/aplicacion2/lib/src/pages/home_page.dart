import 'package:aplicacion2/src/Utiles/icons_string_util.dart';
import 'package:flutter/material.dart';

import '../providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Aplicación Componentes"),),

      body: _list(),

    );
  }
  
  //Future Builder
  Widget _list()
   {    
    //menuprovider.cargarLista()

    return FutureBuilder(
      future: menuprovider.cargarLista(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(children: listItems(snapshot.data, context));
      },
    );
   }
    
   
     List<Widget> listItems(List<dynamic>dato, BuildContext context)
     {
        final List<Widget> opciones = [];

        //Con este for barro todas las opciones que se encuentran dentro de la lista
        for (var opt in dato) { 
          final widgetfinal = ListTile
          (
            title: Text(opt["texto"]),
            leading: getIcon(opt["icon"]),
            trailing: const Icon(Icons.arrow_left_sharp),
            onTap: ()
            {
              Navigator.pushNamed(context, opt['ruta']);
            },
          );
          
          opciones.add(widgetfinal);
          const Divider();

        }
        return opciones;
     }


}