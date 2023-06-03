import 'package:flutter/material.dart';
import 'package:qrapp/src/pages/home_page.dart';
import 'package:qrapp/src/pages/mapas_screen.dart';
import 'package:qrapp/src/pages/screen_map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR App',
      initialRoute: 'home',
      routes: 
      {
        'home' : (BuildContext context)=> const HomePage(),
        'mapa' : (BuildContext context)=>  ScreenMap()
      },
      theme: ThemeData(useMaterial3: false,colorSchemeSeed:Colors.deepPurple ),
    );
  }
}