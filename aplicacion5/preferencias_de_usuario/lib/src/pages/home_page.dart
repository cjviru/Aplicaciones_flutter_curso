import 'package:flutter/material.dart';
import 'package:preferencias_de_usuario/src/share_pref/preferencias_usuario.dart';
import 'package:preferencias_de_usuario/src/widgets/menu.dart';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final pref = PreferenciasUsuario();

    pref.ultimaPagina = "home";

    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: (pref.colorSecundario) ? Colors.blueAccent : Colors.amberAccent, 
        title: const Text('Preferencias'),
      ),

      drawer: MenuWidget(),

      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          Text("Color Secundario: ${pref.colorSecundario}"),
          const Divider(),

          Text("Género: ${pref.genero}"),
          const Divider(),

          Text("Nombre de Usuario: ${pref.usuario}"),
          const Divider(),
        ],
      ),
    );
  }
  
}