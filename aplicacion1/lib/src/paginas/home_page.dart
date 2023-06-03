import 'package:flutter/material.dart';
 
class HomePage extends StatelessWidget
{

  final estilo = new TextStyle(fontSize: 28);
  final conteo=10;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      //Creacion del AppBar
      appBar: AppBar
      (
        centerTitle: true,
        title: Text("APLICACION DE CONTADOR"),

      ),

    //Creacion del body column
    body: Center(child: Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
    [
      Text("Numero de clics",style: estilo),
      Text("$conteo", style: estilo,),
    ],),),

    //Creacion del boton Flotante
    //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, --Ubicacion de un boton
    floatingActionButton:  FloatingActionButton
    ( 
      child: Icon(Icons.add),
      onPressed:(){print("Texto imprimido");},   
    ),

    );
  }
}