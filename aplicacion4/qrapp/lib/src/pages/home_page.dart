import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrapp/src/bloc/scans_bloc.dart';
import 'package:qrapp/src/models/scan_model.dart';
import 'package:qrapp/src/pages/direccion_screem.dart';
import 'package:qrapp/src/pages/mapas_screen.dart';
import 'package:qrapp/src/utils/utils.dart' as utils;

import 'package:qrscan/qrscan.dart' as scanner;

//import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = ScansBloc();

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("QR Scanner"),
        actions: 
        [
          IconButton(onPressed: (){scansBloc.borrarTodosLosScans();}, icon: const Icon(Icons.delete))
        ],
      ),
      body: _cargarPagina(_index),
      bottomNavigationBar: _crearBotonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton
      (
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.filter_center_focus),
        onPressed: ()
        {
          _scanQr(context);
        },
      ),
    );
  }

  Widget _crearBotonNavigationBar() 
  {
    return BottomNavigationBar
    (
      currentIndex: _index,
      onTap: (index)
      {
        setState(() {
          _index=index;
        });
      },
      items: 
      const [ 
        BottomNavigationBarItem(icon: Icon(Icons.map),label: "Mapa"),
        BottomNavigationBarItem(icon: Icon(Icons.brightness_5),label: "Direcciones"),
      ]
    
    );
  }

  Widget _cargarPagina(int _paginaActual) 
  {
    switch (_paginaActual) {
      case 0 : return  MapaScreen();
      case 1 : return  DireccionScreen();
      default: return  MapaScreen();
    }
  }
  
  void  _scanQr(BuildContext context) async 
  {
    String? futurestring = '';

   try 
   {
    futurestring = await scanner.scan();
   } catch (e) 
   {
       futurestring = e.toString();
   }

    if(futurestring!=null)
    {
      final scan = ScanModel(valor: futurestring,);
      scansBloc.agregarScan(scan);
      

    //si estamos en ios se debe esperar un tiempo para que se cierre la camara
    if (Platform.isIOS)
    {
      Future.delayed(const Duration(milliseconds: 750), ()
      {
        utils.abrirScan(scan, context);
      });
    }
    else
      {
        utils.abrirScan(scan, context);  
      }
    }
  }
}