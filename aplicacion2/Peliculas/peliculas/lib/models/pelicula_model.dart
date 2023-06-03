
//CONTENEDOR DE TODAS LAS PELICULAS
 class ContenedorPeliculas
 {
  List<PeliculaModel> items = []; //Creo una lista vacia
  ContenedorPeliculas(); //Constructor vacio
  
  //CREO UN CONSTRUCTOR QUE ME RECIBA EL MAPA DE TODAS LAS RESPUESTAS.
  ContenedorPeliculas.fromJasonList(List<dynamic> jsonList)
  {
    // ignore: unnecessary_null_comparison
    if(jsonList==null)return;

    //barro todos los datos de mi lista
    for(var item in jsonList)
    {
      //creamos una nueva instancia de pelicula y le asignamos los valores que tiene el item a los valores que declaramos en la ultima funcion.
      final pelicula = PeliculaModel.fromJasonMap(item);

      //Esa nueva instancia la almacenos en items de la pelicula
      items.add(pelicula);//El items contiene todas las peliculas mapeadas

    }

  }

 }


class PeliculaModel {
  String? uniqId;

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  PeliculaModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  //creamos otro constructor, uqe llamare cuando quiero generar una instancia de perlicula que viene en formato json
  PeliculaModel.fromJasonMap(Map<String,dynamic> json)
  {
    //Asignamos todas las propiedades a cada objeto Pelicula
    adult             = json["adult"];
    backdropPath      = json["backdrop_path"];
    genreIds          = json["genre_ids"].cast<int>();
    id                = json["id"];
    originalLanguage  = json["original_language"];
    originalTitle     = json["original_title"];
    overview          = json["overview"];
    popularity        = json["popularity"]/1;
    posterPath        = json["poster_path"];
    releaseDate       = json["release_date"];
    title             = json["title"];
    video             = json["video"];
    voteAverage       = json["vote_average"]/1;
    voteCount         = json["vote_count"];
  }


// getPosterImg()
// {
//   if(posterPath==null||posterPath!.isEmpty)
//   {
//     return "https://cdn-icons-png.flaticon.com/512/4044/4044493.png";
  
//   }
//   else
//   {
//     return "https://image.tmbd.org/t/p/w500$posterPath";
    
//   }
// }

}
