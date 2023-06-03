
import 'dart:async';

class Validators
{
  //defining a stream transformer
  //La informacion que fluira con Strings Y la informacion que saldra tambien sera Strings
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    //El sink es el que recibe la informacion y realiza la validacion
    handleData: (password, sink)
    {
      if(password.length >= 6)
      {
        sink.add(password);
      }
      else
      {
        sink.addError("Ingrese más de 6 caracteres por favor");
      }
    }
  );

  //Validamos el Email
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink)
    {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      //Expresion regular
      RegExp regExp = RegExp(pattern.toString());

      if(regExp.hasMatch(email))
      {
        sink.add(email);
      }else
      {
        sink.addError("El email no es correcto");
      }
    }

  );
  



}