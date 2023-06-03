import 'dart:async';

import 'package:flutter/material.dart';

class ListasPage extends StatefulWidget {

  @override
  State<ListasPage> createState() => _ListasPageState();
}

class _ListasPageState extends State<ListasPage> {
  
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  ScrollController _controlador = ScrollController();

  bool cargando=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();

    _controlador.addListener(() 
    { 
      if(_controlador.position.pixels == _controlador.position.maxScrollExtent)
      {
        //_agregar10();
        agregarFuture();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controlador.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Pagina de Listas")),
      body: Stack(children: [
        _crearLista(),
        _crearLoading()
        ],) 
      
    );
  }
  
  Widget _crearLista() 
  {
    return RefreshIndicator(

      onRefresh: _crearPagina1,

      child: ListView.builder(
        
        controller: _controlador,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int indice)
        {
          final imagen = _listaNumeros[indice];
          return FadeInImage(
            placeholder: const AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("http://picsum.photos/500/300/?image=$imagen")
            
            );
        }
        ),
    );
  }

  //Creamos el loading de las primera imagenes estableciendo que cada vez sea diferente, borrando la lista de numeros anterior
  Future<Timer> _crearPagina1() async
  {
    const duracion = Duration(seconds: 3);
    return Timer(duracion, () {
      
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
      });
  }

  void _agregar10()
  {
    for(var i = 0 ; i < 10 ; i++)
    {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() { });
  }
  
  Future<Timer> agregarFuture() async 
  {
    cargando=true;
    setState(() {});
    var dur = const Duration(seconds: 3);
    return Timer(dur,respuestaHTTP);
  }


  void respuestaHTTP() 
  {
    cargando = false;

    //creamos una animacion que nos muestra un poquito mas de la ultima imagen y se haga mas vistosa
    _controlador.animateTo(_controlador.position.pixels + 100, duration: const Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    
    _agregar10();

  }
  
  Widget _crearLoading() 
  {
    if(cargando) 
    {
      return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      //Me permite posicionarlo al tamaño maximo que tenga la pagina
      mainAxisSize: MainAxisSize.max,
      children: 
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: 
          const [
            CircularProgressIndicator()
          ],),

        const SizedBox(height: 15.0,)
      ]
      );
    }else
    {
     return Container();
    }
  }


}