
import 'package:flutter_map/flutter_map.dart';


//importamos el paquete de latitud y longitud manualmente
import 'package:latlong2/latlong.dart';


class ScanModel {
    int? id;
    String? tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    })
    {
      //Si el valor contiene la palabra http, entonces es un link, de lo contrario es un geo
      if(valor.contains('http')){
        tipo = 'http';
    }else
    {
      tipo = 'geo';
    }
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id    : json["id"],
        tipo  : json["tipo"],
        valor : json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id"    : id,
        "tipo"  : tipo,
        "valor" : valor,
    };

    LatLng getLatLng()
    {
      //creo una variable que contiene el valor del scan, ingnore el primer caracter y separe los valores por la coma
      final lalo = valor.substring(4).split(','); 
      final lat  = double.parse(lalo[0]);
      final lng  = double.parse(lalo[1]);

      return LatLng(lat,lng);

    }


}