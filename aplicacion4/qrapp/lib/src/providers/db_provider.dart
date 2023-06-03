

//Utilizaremos el patron singleton para crear una unica instancia de la clase
import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/scan_model.dart';

class DBProvider
{
  //Esta es mi instancia de la base de datos
  static Database? _database;
  
  //Esta es la instancia de la clase, utilizando un constructor privado(._)
  static final DBProvider db = DBProvider._();

  //Constructor privado
  DBProvider._();

  //Este metodo me permite obtener la instancia de la base de datos 
  Future<Database> get database async
  {
    //Si la base de datos ya fue creada, entonces la retorno
    if(_database != null) return _database!;

    //Si no, entonces la creo
    _database = await initDb();

    //Y la retorno
    return _database!;
  }


  //Este metodo me permite inicializar la base de datos
   initDb() async
  {
    //Obtengo el path de la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    //Lo uno con el nombre de la base de datos
    String path = join(documentsDirectory.path,'ScansDB.db');

    //Creo la base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async
      {
        //Creo la tabla de scans
        await db.execute(
          'CREATE TABLE Scans('
          'id INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'valor TEXT'
          ')'
        );
      }
    );

  }

  // Este metodo me permite crear un nuevo scan
  // nuevoScanRaw(ScanModel nuevoScan) async
  // {
  //   Obtengo la referencia a la base de datos
  //   final db = await database;

  //   Inserto el nuevo scan
  //   final res = await db.rawInsert(
  //     "INSERT INTO Scans(id,tipo,valor) "
  //     "VALUES (${nuevoScan.id},'${nuevoScan.tipo}','${nuevoScan.valor}')"
  //   );

  //   Retorno el resultado
  //   return res;
  // }


  //Este metodo me permite crear un nuevo scan, mas seguro
  nuevoScan(ScanModel nuevoScan) async
  {
    //Obtengo la referencia a la base de datos
    final db = await database;

    //Inserto el nuevo scan
    final res = await db.insert('Scans',nuevoScan.toJson());

    //Retorno el resultado
    return res;
  }

  //select - Obtener informacion
  Future<ScanModel?> getScanById(int id) async
  {
    //Obtengo la referencia a la base de datos
    final db = await database;

    //Obtengo el scan con el id que me pasaron
    final res = await db.query('Scans',where: 'id = ?',whereArgs: [id]);

    //Si el resultado esta vacio, retorno null
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  //Obtnego todos los scans
  Future<List<ScanModel>>getTodosLosScans()async
  {
    //Obtengo la referencia a la base de datos
    final db = await database;

    //Obtengo todos los scans
    final res = await db.query('Scans');

    //Los convierto a una lista de ScanModel
    List<ScanModel> list = res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];

    //Retorno la lista
    return list;
  }

  //Obtengo todos los scans por tipo
  Future<List<ScanModel>>getScansPorTipo(String tipo)async
  {
    //Obtengo la referencia a la base de datos
    final db = await database;

    //Obtengo todos los scans
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo='$tipo'");

    //Los convierto a una lista de ScanModel
    List<ScanModel> list = res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];

    //Retorno la lista
    return list;
  }

//Actualizar registros
Future<int> updateScan(ScanModel nuevoScan) async
{
  final db = await database;
  final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);

  return res;
}

//Eliminar registros
Future <int> deleteScan(int id)async
{
  final db = await database;

  final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

  return res;
}

//Eliminar todos los registros
Future <int> deleteAll() async
{
  final db = await database;
  final res = db.delete('Scans');
  return res;
}



}
