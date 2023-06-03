import 'package:disenos/src/pages/botones_pages.dart';
import 'package:disenos/src/pages/page_basico.dart';
import 'package:disenos/src/pages/scrool_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: 'Diseños',
      initialRoute: "botones",
      routes: 
      {
        
        "basico" : (context) => BasicoPage(),
        "scrool" : (context) => ScroolPage(),
        "botones" : (context) => BotonesPages(),
      },

    );
  }
}