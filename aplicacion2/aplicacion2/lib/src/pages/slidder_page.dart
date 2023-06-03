
import 'package:flutter/material.dart';



class SlidderPage extends StatefulWidget {

  @override
  State<SlidderPage> createState() => SlidderPageState();
}

class SlidderPageState extends State<SlidderPage> {
  
  double _valorSlidder = 200.0;
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Pagina de Slidders"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(children: 
                      [ 
                        _crearSlidder(),
                        _crearCheckBoxs(),
                        _crearswitch(),
                        Expanded(child:  _crearImagen()),
                        
                      ],)
        
        ),
      
    );
  }
  
  Widget _crearSlidder() 
  {
    return Slider
    (
      label: "Tamaño",
      activeColor: Colors.indigo,
      value:_valorSlidder, 
      min: 20.0,
      max: 400.0,
      //
      onChanged: (_check) ? null : (valor)
      {
        setState(() { _valorSlidder = valor; });        
      }
    );
  }
  
  Widget _crearswitch()
  {
    return SwitchListTile(
      
      title: const Text("Bloquear Switch"),
      value: _check, 
      onChanged: (valor)
      {
        setState(() {
          _check = valor;
        });
      }
      );
  }

  Widget _crearCheckBoxs() 
  {
    return CheckboxListTile(
      title: const Text("Desahibiltar Slider"),
      value: _check, 
      onChanged: <bool>(valor)
      {
        setState(() {
          _check = valor;
        });
         
      });
    //Forma de hacer un checkBox solo
    /*return Checkbox
    (
      value: _check, 
      onChanged: <bool>(valor)
      {
        setState(() {
          _check = valor;
        });
         
      }
    );*/
  }

  Widget _crearImagen() 
  {
    return 
    
    FadeInImage(placeholder: const AssetImage("assets/jar-loading.gif"), image: const NetworkImage("https://www.megaidea.net/wp-content/uploads/2018/06/DRAGON-BALL-18-658x1024.png"),
    width: _valorSlidder,
    fit: BoxFit.contain,
    
    

    );
  }
  
  

}
