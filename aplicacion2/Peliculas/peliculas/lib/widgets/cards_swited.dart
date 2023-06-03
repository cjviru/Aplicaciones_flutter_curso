import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/pages/pelicula_detalle.dart';

class CardsPage extends StatelessWidget {

  final List<PeliculaModel>? peliculas;//creamos la lista de las tarjetas

//Inicializamos peliculas en un constructor.(y le decimos que es obligatorio la lista de peliculas donde quiera que se utilice)
  CardsPage({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

  //me da informacion hacerca del dispositivo
  final _tamTarjeta = MediaQuery.of(context).size;

    //creamos el swiper
  return Container(
     padding: const  EdgeInsets.only(top: 20.0),
          child: Swiper(
             layout: SwiperLayout.STACK,//modelo
             itemWidth  : _tamTarjeta.width * 0.7,
             itemHeight : _tamTarjeta.height * 0.5,
             itemBuilder   : (BuildContext context,int index)
            {

              peliculas![index].uniqId = "${peliculas![index].id}-tarjeta";

              //Con el clipRRect le podemos dar bordes redondos
             return Hero(
              tag: "${peliculas![index].uniqId}",
               child: ClipRRect
               (
                borderRadius: BorderRadius.circular(20.0),
                
                child: GestureDetector
                (
                  onTap: ()
                  {
                    Navigator.pushNamed(context, "detalle", arguments: peliculas![index]);
                  },
                  child: FadeInImage
                  (
                    placeholder: const AssetImage("assets/img/no-image.jpg"), 
                    image      : NetworkImage('https://image.tmdb.org/t/p/w500${peliculas![index].posterPath}'),
                    fit        : BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    
                    // imageErrorBuilder: (context, error, stackTrace) //validamos los urls que no estan funcionando
                    // {
                    //   return Image.asset
                    //   (
                    //     "assets/img/no-image.jpg",
                    //     fit   : BoxFit.cover,
                    //     width : double.infinity,
                    //     height: double.infinity
                    //   );
                    // }
                             
                  ),
                )
                         ),
             ); //pagination:  const SwiperPaginat ion(),
              //control:  const SwiperControl()
          },
            itemCount: peliculas!.length,
          )
        );

  }
}