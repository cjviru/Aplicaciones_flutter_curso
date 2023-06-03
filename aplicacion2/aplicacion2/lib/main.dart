
import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart";

import 'package:aplicacion2/src/pages/alert_page.dart';
import 'package:aplicacion2/src/routes/routes.dart';
//import 'package:aplicacion2/src/pages/home_temp.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const[
    Locale('en'), // English
    Locale('es'), // Spanish
  ],
      title: 'Componentes',
      //home: HomePage());
      initialRoute: "/",
      routes: getRutas(),
      
      onGenerateRoute: (settings)
      {
        return MaterialPageRoute(builder: (BuildContext context)=>AlertPage());
      },

      );
  }
}