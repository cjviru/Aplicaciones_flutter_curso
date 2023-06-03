import 'dart:async';

import 'package:flutter/material.dart';


class ContadorPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=>_ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage>
{
  final _estilo = new TextStyle(fontSize: 28);
  int _conteo=0;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      //Creacion del AppBar
      appBar: AppBar
      (
        centerTitle: true,
        title: Text("APLICACION CONTADOR"),

      ),

    //Creacion del body column
    body: Center(child: Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
    [
      Text("Numero de clics",style: _estilo),
      Text("$_conteo", style: _estilo,),
    ],),),

    floatingActionButton: _crearBotones()

    );
    
  }

   


Widget _crearBotones()
{
  return Row
  (
    mainAxisAlignment: MainAxisAlignment.end,
    children: 
    [
      
      SizedBox(width: 30,),

      //Primer Boton
      FloatingActionButton(child : Icon(Icons.exposure_zero),onPressed: _reset),

      Expanded(child : SizedBox()),

      //Segundo boton
      FloatingActionButton(child:Icon(Icons.add),onPressed: _agregar),
      
      SizedBox(width: 15.0),

      //Tercer Boton
      FloatingActionButton(child: Icon(Icons.remove),onPressed:_sustraer),

      

      

    ],
  );
}

  void _agregar()
  {
      setState(() 
      {
        _conteo++;  
      });
  }

  void _sustraer()
  {
      setState(() 
      {
        _conteo--;
      });
  }

  void _reset()
  {
    setState(() 
    {
      _conteo=0;
    });
  }
}
