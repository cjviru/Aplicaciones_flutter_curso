
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  //Creamos una funcion para pasar a la siguientes pagina
  final Function siguientePagina;

  final List<PeliculaModel> peliculaHorizontal;
  MovieHorizontal({required this.peliculaHorizontal, required this.siguientePagina});

  //creamos una variable para poder acceder desde otra y saber la posicion final
    final _pageController = PageController
        (
          initialPage: 1,
          viewportFraction: 0.3//numero de tarjetas
          
        );

  @override
  Widget build(BuildContext context) {
    
    final sizePantalla = MediaQuery.of(context).size;

    //aca sabemos la posicion final
    _pageController.addListener(()
    {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent-200)
      {
        siguientePagina();
      }
    });

    return Container
    (
      height: sizePantalla.height * 0.2,
      child: PageView.builder
      (
        controller: _pageController,
        pageSnapping: false, //quitamos el magneto
        //children: _tarjetas(context),
        itemBuilder: (context, i)
        => _targetPageBuilder(context, peliculaHorizontal[i]),
        
        itemCount: peliculaHorizontal.length,
      ),
      
    );
  }

  Widget _targetPageBuilder(BuildContext context, PeliculaModel peli)
  {
    peli.uniqId = "${peli.id}-tarjetaHorizontal";

    final _peliculaTarjeta = Container
      (
        margin: const EdgeInsets.only(right : 15.0),
        child: Column(
          children: [
            Hero(
              tag: "${peli.uniqId}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  placeholder: const AssetImage("assets/img/no-image.jpg"), 
                  image: NetworkImage("https://image.tmdb.org/t/p/w500${peli.posterPath}"),
                  fit: BoxFit.cover,
                  height: 160.0,
                  ),
              ),
            ),
            const SizedBox(height: 10.0,),

            Text //ponemos el titulo a las peliculas
            (
              (peli.title).toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );

      return GestureDetector
      (
        child: _peliculaTarjeta,
        onTap: ()
        {
          Navigator.pushNamed(context,"detalle", arguments: peli);//mandamos como argumento todos los datos de las peliculas
        },
      );
  }


  
 List<Widget> _tarjetas(BuildContext context) 
  {
    return peliculaHorizontal.map((peli) //instancia individual de peliculaProvider
    {
      return Container
      (
        margin: const EdgeInsets.only(right : 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: const AssetImage("assets/img/no-image.jpg"), 
                image: NetworkImage("https://image.tmdb.org/t/p/w500${peli.posterPath}"),
                fit: BoxFit.cover,
                height: 160.0,
                
                
                // imageErrorBuilder: (context, error, stackTrace) //validamos los urls que no estan funcionando
                //       {
                //         return Image.asset
                //         (
                //           "assets/img/no-image.jpg",
                          
                //         );
                //       }       
                
                ),
            ),
            const SizedBox(height: 10.0,),

            Text //ponemos el titulo a las peliculas
            (
              (peli.title).toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();  
  }
}