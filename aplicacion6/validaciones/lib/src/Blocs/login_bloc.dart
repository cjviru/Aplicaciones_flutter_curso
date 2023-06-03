
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:validaciones/src/Blocs/validators.dart';

class LoginBloc with Validators
{

  //StreamController para el email y el password, serviran para validar los campos
  // final _emailController = StreamController<String>.broadcast();
  // final _passwordController = StreamController<String>.broadcast();

  //Para trabajar con el combine se neceista usar el BehaviorSubject en reemplazo del StreamController
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Insertar Valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  //Recuperar los datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);


  Stream<bool> get formularioValido =>
    CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);


  //Obtener el ultimo valor ingresado a los Streams
  String get email => _emailController.value;
  String get password => _passwordController.value;


  //Cerrar los Streams cuando no se usen
  dispose()
  {
    _emailController.close();
    _passwordController.close();
  }


}