import 'dart:async';

import 'package:qrapp/src/bloc/validator.dart';
import 'package:qrapp/src/models/scan_model.dart';
import 'package:qrapp/src/providers/db_provider.dart';

class ScansBloc with Validator
{
  static final ScansBloc _singleton = ScansBloc._internal();

//este factory me permite retornar una instancia de la clase
  factory ScansBloc()
  {
    //Si la instancia no ha sido creada, entonces la creo
    return _singleton;
  }


  ScansBloc._internal()
  {
    // Obtener Scans de la base de datos
    obtenerScans();
  }

  //StreamController me permite escuchar los cambios que se hagan en el stream
  final _scancontroller = StreamController<List<ScanModel>>.broadcast();

//Este getter me permite escuchar los cambios que se hagan en el stream
  Stream<List<ScanModel>>  get scansStream => _scancontroller.stream.transform(validarGeo);


Stream<List<ScanModel>>  get scansStreamHttp => _scancontroller.stream.transform(validadHttp);


  dispose()
  {
    _scancontroller.close();
  }


  //Este metodo me permite obtener los scans de la base de datos
  obtenerScans()async
  {
    _scancontroller.sink.add(await DBProvider.db.getTodosLosScans());

  }

  agregarScan(ScanModel scan)async
  {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScans(int id)async
  {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarTodosLosScans()async
  {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }


}