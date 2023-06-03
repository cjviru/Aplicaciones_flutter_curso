import 'package:flutter/material.dart';
import 'package:validaciones/src/Blocs/login_bloc.dart';
export 'package:validaciones/src/pages/login_screen.dart';


class Provider extends InheritedWidget
{

  //creamos un singleton
  static Provider? _instancia;

//El factory determina si se crea una nueva instancia o se retorna la instancia existente
  factory Provider({Key ?key, required Widget child})
  {
    //Si la instancia es nula, se crea una nueva instancia
    _instancia ??= Provider._internal(key: key,child: child,);

    //Si la instancia no es nula, se retorna la instancia existente
    return _instancia!;
  } 

  Provider._internal({Key? key, required Widget child})
   :super(key: key, child: child);

  final loginBloc = LoginBloc();

  
  // Provider({ Key? key, required Widget child})
  // : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context)
  {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()as Provider).loginBloc;
  }


}