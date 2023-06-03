
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario
{
  static final PreferenciasUsuario _intancia = PreferenciasUsuario._internal();


  factory PreferenciasUsuario()
  {
    return _intancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences? _prefs;

  inicializarPreferencia() async
  {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del Genero
   int get genero
  {
    return _prefs?.getInt('genero')?? 2;
  }

  set genero(int value)
  {
    _prefs?.setInt('genero', value);
  }

  // GET y SET del Color Secundario
   bool get colorSecundario
  {
    return _prefs?.getBool('colorSecundario')?? true;
  }

  set colorSecundario(bool value)
  {
    _prefs?.setBool('colorSecundario', value);
  }

  // GET y SET del Color Secundario
   String get usuario
  {
    return _prefs?.getString('nombreUsuario')?? "Usuario";
  }

  set usuario(String value)
  {
    _prefs?.setString('nombreUsuario', value);
  }

  // GET y SET del Color Secundario
   String get ultimaPagina
  {
    return _prefs== null? _prefs?.getString('ultimaPagina')?? "home" : _prefs!.getString('ultimaPagina')?? "configuracion";
  }

  set ultimaPagina(String value)
  {
    _prefs?.setString('ultimaPagina', value);    
  }

}