
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:peliculas/models/pelicula_model.dart';

import '../models/actores_model.dart';

class PeliculasProviders
{
  final String _apikey    = "21b84e452d589f7fb928d26555e276ad";
  final String _url       = "api.themoviedb.org"; //aqui centralizamos las urls
  final String _languaje  = "es-ES";

  int _popularesPage      = 0;
  bool _cargando = false;
  List<PeliculaModel> _pelPopular = [];

  //Creamos el Stream o flujo de datos
  //El broadcast lo ponemos para que varias personas o lugar pueddan escuchar el stream
  final _popularStream = StreamController<List<PeliculaModel>>.broadcast();

  Function(List<PeliculaModel>) get popularesSink => _popularStream.sink.add;

  Stream<List<PeliculaModel>> get popularesStream => _popularStream.stream;

  //cerramos el stream
  void disposeStream()
  {
    _popularStream.close();
  }

  //creamos un metodo para llamar a la ruta especifica donde estan las peliculas en la pagina web
  //devuelve las peliculas ya mapeadas
  Future<List<PeliculaModel>> getEnCines() async 
  {
    //construimos la url
    final url = Uri.https(_url,'3/movie/now_playing', 
    {
      //Parametros adicionales
      'api_key'  : _apikey,
      'language' : _languaje
    });

    //hacemos la peticion HTT(Esto retorna toda la respuesta HTTP)
    final resp = await http.get(url);

    //Decodificamos la data(que nos envia toda la url en forma de string, con el decode lo trasformamos a un mapa).
    
    final dataDecodificada = json.decode(resp.body);
    
    final peliculas        = ContenedorPeliculas.fromJasonList(dataDecodificada["results"]);

    return peliculas.items;

  }


  Future <List<PeliculaModel>> getPopular() async
  {
    //Compruebo si esty cargando para que recien empiece a cargar la siguiente pagina
    if(_cargando)return [];
    _cargando = true;

    _popularesPage++;
    final urlPopular = Uri.https(_url,"3/movie/popular",
    {
      "api_key"  : _apikey,
      "language" : _languaje,
      "page"     : _popularesPage.toString()
    });

    final respuesta  = await http.get(urlPopular);
    final datosdecodificados = jsonDecode(respuesta.body);

    final populares  = ContenedorPeliculas.fromJasonList(datosdecodificados["results"]);
    final resp = populares.items;

    _pelPopular.addAll(resp);
    
    //Le mandamos informacion al sink
    popularesSink(_pelPopular);

    _cargando = false;
    return resp;

    
  }


Future<List<Actor>> getCast(String peliId) async
{

  final url = Uri.https(_url,"3/movie/$peliId/credits",
  {
    "api_key" : _apikey,
    "languaje":_languaje,
  });

  final resp = await http.get(url);
  final datadecodctores = jsonDecode(resp.body);

  final castInstancia = Cast.fromJsonList(datadecodctores["cast"]);

  return castInstancia.actores;

}


Future<List<PeliculaModel>> getBuscar(String query) async 
  {
    //construimos la url
    final url = Uri.https(_url,'3/search/movie', 
    {
      //Parametros adicionales
      'api_key'  : _apikey,
      'language' : _languaje,
      "query"    : query
    });

    //hacemos la peticion HTT(Esto retorna toda la respuesta HTTP)
    final resp = await http.get(url);

    //Decodificamos la data(que nos envia toda la url en forma de string, con el decode lo trasformamos a un mapa).
    
    final dataDecodificada = json.decode(resp.body);
    
    final peliculas        = ContenedorPeliculas.fromJasonList(dataDecodificada["results"]);

    return peliculas.items;

  }
}
