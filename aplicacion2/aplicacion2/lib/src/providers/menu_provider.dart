import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class _Menuprovider
{
  List<dynamic> opciones = [];
  _Menuprovider()
  {
   // cargarLista();
  }

  
  Future<List<dynamic>> cargarLista() async
  {
    final resp = await rootBundle.loadString("data/menu_opts.json");
    Map dataMap = json.decode(resp);
    opciones = dataMap["rutas"];
    
    return opciones;
  }
}

final menuprovider = _Menuprovider();



