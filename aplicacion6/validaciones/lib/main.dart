import 'package:flutter/material.dart';
import 'package:validaciones/src/Blocs/provider.dart';
import 'package:validaciones/src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider
    (key: key, 
    child: MaterialApp(
      title: 'Validaciones',
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginScreenPage(),
        'home'  : (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch
        (
          primarySwatch: Colors.deepPurple
        )
      ),
    )
    );
    
    
  }
}