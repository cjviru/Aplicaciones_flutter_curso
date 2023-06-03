import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/providers/peliculas_providers.dart';

class DataBuscar extends SearchDelegate
{

  //creo una nuesva instancia de peliculas provider para mi build
  final peliculasProviders = PeliculasProviders();

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Acciones de nuestro AppBar
    return [IconButton
    (
      onPressed: (){query="";}, icon: Icon(Icons.clear)
    )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton
    (
      onPressed: ()
      {
        close(context, null);
      }, 
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // Sugerencias que aparecen cunado la persona escribe
    if(query.isEmpty)
    {return Container();}
    
      return FutureBuilder(
        future: peliculasProviders.getBuscar(query),
        builder: (BuildContext context, AsyncSnapshot<List<PeliculaModel>> snapshot) 
        {
          if(snapshot.hasData)
          {
            final peliculadat = snapshot.data;
                       
            
            return ListView
            (
              //Convierto mis peliculas a una coleccion de widgets
              children: peliculadat!.map((peliculasugerencia) 
              {       
                   
                return ListTile
                (
                  leading:peliculasugerencia.posterPath != null
                  ? FadeInImage(
                    placeholder:
                        const AssetImage("assets/img/no-image.jpg"),
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${peliculasugerencia.posterPath}"),
                    width: 50.0,
                    fit: BoxFit.contain,
                  )
                  
                : Image.asset("assets/img/no-image.jpg",
                    //File("assets/img/no-image.jpg"),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  
                  title   : Text("${peliculasugerencia.title}"),
                  subtitle: Text("${peliculasugerencia.originalTitle}"),

                  onTap: ()
                  {
                    close(context, null);
                    peliculasugerencia.uniqId="";
                    Navigator.pushNamed(context, "detalle",arguments: peliculasugerencia);
                  },
                  
                );
           }).toList()
              
            );
          }
          else
          {
            return const Center(child: CircularProgressIndicator());
          } 
        },
      );
    
  }

}