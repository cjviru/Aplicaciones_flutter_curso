import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/providers/peliculas_providers.dart';

import '../models/actores_model.dart';


class PeliculaDetalle extends StatelessWidget {
 
  //creamos una variable que recibira todos los argumentos de las peliculas para poder mostralo en esta pantalla

  @override
  Widget build(BuildContext context) {

    final PeliculaModel peliculadet = ModalRoute.of(context)?.settings.arguments as PeliculaModel;
    
    return Scaffold 
    (
      body: CustomScrollView
      (
        slivers: 
        [
          _crearAppBar(peliculadet),
          //creamos unos widgtes normales
          //en este caso una especie de list view

          SliverList
          (
            delegate: SliverChildListDelegate
            (
              [
                const SizedBox(height: 10.0,),
                _posterTitulo(context,peliculadet),
                Container(
                  padding: const EdgeInsets.only(left: 20.0,top: 20.0),
                  child: Text("Sinopsis",style: Theme.of(context).textTheme.titleLarge)),
                _descripcion(peliculadet),
                const SizedBox(height: 50.0),
                Container(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: Text("Actores",style: Theme.of(context).textTheme.titleLarge)),
                _crearCasting(peliculadet),
              ]
            )
          )

        ],)
    );
  }
  
  Widget _crearAppBar(PeliculaModel peliculaAppBar) 
  {
    return SliverAppBar
    (
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar
      (
        centerTitle: true,
        title: Text
        (
          "${peliculaAppBar.title}",
           style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),

        background:peliculaAppBar.backdropPath != null ? FadeInImage
        (
          placeholder: const AssetImage("assets/img/loading.gif"), 
          image      : NetworkImage("https://image.tmdb.org/t/p/w500${peliculaAppBar.backdropPath}"),
          fadeInDuration: const Duration(milliseconds: 250),
          fit: BoxFit.cover,
        )
        
        :Image.asset("assets/img/no-image.jpg",
          fit: BoxFit.cover,)
        

      ),

    ); 
  }
  
  Widget _posterTitulo(BuildContext context ,PeliculaModel peliculaPoster) 
  {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row
    (children: 
      [
        Hero(
          tag: "${peliculaPoster.uniqId}",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: peliculaPoster.posterPath!=null ?Image(image:NetworkImage("https://image.tmdb.org/t/p/w500${peliculaPoster.posterPath}"),
            
            height: 150.0,
            )
            :Image.asset("assets/img/no-image.jpg", height: 150,)

            ),
        ),

        const SizedBox(width: 20.0,),

        Flexible
        (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: 
            [
              Text("${peliculaPoster.title}",style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 5.0,),
              Text("${peliculaPoster.originalTitle}", style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 5.0,),
              Text("Fecha de Lanzamiento: ${peliculaPoster.releaseDate}", style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 3.0,),
              Row(children: 
              [
                const Icon(Icons.star_border),
                Text("${peliculaPoster.voteAverage}", style: Theme.of(context).textTheme.bodySmall)
              ],),
              
            ],)
        )
      ],
    ),
    );
  }
  
  Widget _descripcion(PeliculaModel peliculaDescripcion) 
  {
    return Container
    (
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: 
      (
        Text("${peliculaDescripcion.overview}",textAlign: TextAlign.justify, textScaleFactor: 1.1,style: const TextStyle(height: 1.5),
      )
    ));
  }
  
  Widget _crearCasting(PeliculaModel peliculadet) 
  {
    final peliprovider = PeliculasProviders();
    return FutureBuilder(
      future: peliprovider.getCast(peliculadet.id.toString()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData)
        {
          return crearActoresPage(snapshot.data);
        }
        else
        {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );

  }
  
  Widget crearActoresPage(List<Actor> actores) 
  {
    return SizedBox(
      
      height: 300,
      child: PageView.builder
      (
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemBuilder: (contex,i)
        {
          return Column(

            children: [
              _tarjetaActor(actores[i]),
            ],
          );
        },
        itemCount: actores.length,
      ),
    );
  }
  
  Widget _tarjetaActor(Actor actores) 
  {             
      return Container(
        margin: const EdgeInsets.only(right : 15.0),
        child: 
        Column(children: 
        [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: actores.profilePath!=null? FadeInImage
            (
              placeholder:const AssetImage("assets/img/no-image.jpg") , 
              image: NetworkImage("https://image.tmdb.org/t/p/w500${actores.profilePath}"),
              height: 150.0,
              fit: BoxFit.cover,
            )
            : Image.asset("assets/img/no-image.jpg",
            height: 150.0,
            fit: BoxFit.cover,
            )

            ),
               
            Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("${actores.name}",overflow: TextOverflow.ellipsis,)
              )
        ]),
        
        );
  }
}