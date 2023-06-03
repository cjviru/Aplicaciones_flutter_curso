

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrapp/src/models/scan_model.dart';


class ScreenMap extends StatefulWidget {
   const ScreenMap({super.key});

  @override
  State<ScreenMap> createState() => _ScreenMapState();
}

class _ScreenMapState extends State<ScreenMap> {
  MapController map = MapController();

  String tipoMapa = 'streets-v11';

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Coordenadas QR"),
        actions: 
        [
          IconButton(onPressed: ()
          {
            
            map.move(scan.getLatLng(), 10);
          }, 
            icon: const Icon(Icons.my_location))
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearboton(context),
    );
  }

  Widget _crearFlutterMap(ScanModel scan) 
  {
    return FlutterMap
    (
      mapController: map,
      options: MapOptions
      (
        //ubicacion inicial del mapa
        center: scan.getLatLng(),
        zoom: 10.0,
      ),
      children: 
      [
        _crearMapa(),
        _crearMarcadores(scan),
      ],
      
    );
  }

  _crearMapa() 
  {
    return TileLayer
    (
      urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
      additionalOptions: 
       {
        'accessToken': 'pk.eyJ1IjoiY2p2aXJ1IiwiYSI6ImNsaHY1dGF1ZDA1b3AzZW8xbmd1N2huOXkifQ.7-UL3yqIrjo2lDfEspNL5w',
        'id': 'mapbox/$tipoMapa'
      }
    );
  }

  _crearMarcadores(ScanModel scan) 
  {
    return MarkerLayer
    (
      markers: 
      [
        Marker
        (
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (context) => Container
          (
            child: Icon(Icons.location_on, size: 45.0, color: Theme.of(context).primaryColor,),
          ),
        )
      ],
    );
  }

  Widget _crearboton(BuildContext context) 
  {
    return FloatingActionButton
    (
      onPressed: ()
      {
        setState(() {
          if(tipoMapa == 'streets-v11')
          {
            tipoMapa = 'dark-v10';
          }
          else if(tipoMapa == 'dark-v10')
          {
            tipoMapa = 'light-v10';
          }
          else if(tipoMapa == 'light-v10')
          {
            tipoMapa = 'outdoors-v11';
          }
          else if(tipoMapa == 'outdoors-v11')
          {
            tipoMapa = 'satellite-v9';
          }
          else if(tipoMapa == 'satellite-v9')
          {
            tipoMapa = 'streets-v11';
          }
        }); 
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.repeat),
    );
  }
}