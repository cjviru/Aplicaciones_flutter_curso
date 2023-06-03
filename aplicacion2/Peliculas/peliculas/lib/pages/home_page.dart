
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peliculas/providers/peliculas_providers.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/cards_swited.dart';
import 'package:peliculas/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final peliculasproviders1 = PeliculasProviders();
  

  @override
  Widget build(BuildContext context) {

     //Ejecutamos el metodo que le mandara las peliculas al sink para que nos muestre las peliculas en el StreamBuilder
      peliculasproviders1.getPopular();

    return Scaffold
    (
      
      //Creamos nuestro AppBar
      appBar: AppBar
      (
        title: const Text("CINEPEDIA"),
        backgroundColor: Colors.indigo,
        actions: //Creamos nuestro boton de buscar
        [
          IconButton
          (
            onPressed: ()
            {
              showSearch
              (
                context : context, 
                delegate: DataBuscar() 
              );
            }, 
            icon: const Icon(Icons.search)
          )
        ],
      ),

      //Creamos el body
      body: Container
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
          [
            _crearTarjetas(),
            _footer(context)
          ],
        )
      ),
    );
  }
  
  Widget  _crearTarjetas()
  {
    
    return FutureBuilder(
      future: peliculasproviders1.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if(snapshot.hasData){
        return CardsPage(peliculas: snapshot.data);
        }
        else
        {
          return Container (
            height: 400.0,
            child :Center(child: CircularProgressIndicator()));
        }
      },
    );       
  }

  Widget _footer(BuildContext context)
  {

    return Container
    (
      width: double.infinity,
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: 
        [
        
        Container(
          padding:const  EdgeInsets.only(left: 20.0),
          child: Text("Populares",style: Theme.of(context).textTheme.headlineSmall),
          ),//Esto esta en el materialApp 
          const SizedBox(height: 10.0,),

        StreamBuilder(
          stream: peliculasproviders1.popularesStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            
            if(snapshot.hasData)
            {
              return MovieHorizontal(peliculaHorizontal: snapshot.data, siguientePagina: peliculasproviders1.getPopular);
            }
            else{return const Center(child: CircularProgressIndicator());}
          },
        ),
        
      ]),
    );
  }

} 