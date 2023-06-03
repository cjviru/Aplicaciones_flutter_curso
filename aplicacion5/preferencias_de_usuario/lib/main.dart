import 'package:flutter/material.dart';
import 'package:preferencias_de_usuario/src/pages/home_page.dart';
import 'package:preferencias_de_usuario/src/pages/settings.dart';
import 'package:preferencias_de_usuario/src/share_pref/preferencias_usuario.dart';

void main(){ 
  
  runApp(MyApp());

  final prefs = PreferenciasUsuario();
  prefs.inicializarPreferencia();
  
  }

class MyApp extends StatelessWidget {
   MyApp({super.key});

final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: 
      {
        "home": (BuildContext context) => Homepage(),

        "configuracion": (BuildContext context) => SettingsPage(),
      }, 
    );
  }
}