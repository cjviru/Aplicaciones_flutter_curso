import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Pagina de alertas")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_rounded),
        onPressed:(){ Navigator.pop(context);}
        ),
      
      body: Center
      (child: ElevatedButton (
        onPressed: ()=>_mostrarAlerta(context),
        style: ElevatedButton.styleFrom(elevation: 3.0,textStyle: const TextStyle(fontSize: 25.0),padding: const EdgeInsets.all(15),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

        child: const Text("Alerta"),
        
      
        
      ),
    ));
    
  }

  void _mostrarAlerta(BuildContext context)
  {
    showDialog(context: context, builder:(context)
    {

      return AlertDialog
      (
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Violacion de seguridad"),
        content: Column(
        mainAxisSize: MainAxisSize.min,  
        children: 
        const [

          Text("La integridad del dispositivo esta en riesgo"),
          SizedBox(height: 10,),
          FlutterLogo(size: 100)
        ]),

        actions: 
        [
          //Boton 1
        ElevatedButton
        (
          child: const Text("Cancelar"),
          onPressed: ()=>Navigator.of(context).pop()
          
        ),
        
        //Boton 2
        ElevatedButton
        (
          child: const Text("OK"),
          onPressed: ()=>Navigator.of(context).pop()
          
        )
        ],
      );
    }
    );
  }

}