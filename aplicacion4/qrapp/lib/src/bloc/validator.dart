


import 'dart:async';

import 'package:qrapp/src/models/scan_model.dart';

class Validator
{
  //Imgresara una lista de ScanModel y retornara una lista de ScanModel

  //validacion geo
  final validarGeo = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers
  (
    handleData: (scan,sink)
    {
      final geoScan = scan.where((s) => s.tipo == 'geo').toList();
      sink.add(geoScan);
    }
  );


//Validadcion http
  final validadHttp = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers
  (
    handleData: (scan, sink)
    {
      final httpScan = scan.where((s) => s.tipo == 'http').toList();
      sink.add(httpScan);
    }
  );
  
}