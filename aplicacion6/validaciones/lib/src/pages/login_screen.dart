import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validaciones/src/Blocs/login_bloc.dart';
import 'package:validaciones/src/Blocs/provider.dart';

class LoginScreenPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Stack(children: 
      [
        _crearFondo(context),
        _loginForm(context),  
      ],)
    );
  }
  
  Widget _crearFondo(BuildContext context) 
  {
    final size = MediaQuery.of(context).size;

    final _fondoMorado = Container
    (
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration
      (
        gradient: LinearGradient(colors: 
        [
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0),
        ])
      ),
    );
    
    final _circulo = Container
    (
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration
      (
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white.withOpacity(0.05)
      ),
    );
    
    return Stack
    (
      children: 
      [
        _fondoMorado,
        Positioned(top: 90.0, left: 30.0, child: _circulo,),
        Positioned(top: -40.0, left: -30.0, child: _circulo,),
        Positioned(bottom: -50.0, right: -10.0, child: _circulo,),
        Positioned(bottom: 120.0, right: 20.0, child: _circulo,),
        Positioned(bottom: -50.0, left: -20.0, child: _circulo,),

        Container
        (
          padding: const EdgeInsets.only(top: 90.0),
          child: Column
          (
            
            children: 
            const [
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0,),
              SizedBox(height: 10.0,width: double.infinity,),
              Text("Cristian Villaverde", style: TextStyle(color: Colors.white, fontSize: 25.0),),
            ],
          ),
        )
      ],
    );
  }
  
  Widget _loginForm(BuildContext context) 
  {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView
    (
      child: Column
      (
        children: 
        [
          SafeArea
          (
            child: Container
            (
              height: 210.0,
            )
          ),

          Container
          (
            width: size.width * 0.85,
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration
            (
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: 
              const [
                BoxShadow
                (
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column
            (
              children: 
               [
                 const Text("Ingreso", style: TextStyle(fontSize: 20.0),),
                  const SizedBox(height: 35.0,),
                  _crearEmail(bloc),
                  const SizedBox(height: 15.0,),
                  _crearPassword(bloc),
                  const SizedBox(height: 50.0,),
                  _crearBottom(bloc)
              ],
            ),
          )
        
          ,TextButton(
            onPressed: (){}, 
            child: const Text("¿Olvido la contraseña?", style: TextStyle(fontSize: 15),)),
            const SizedBox(height: 100.0,)

        ],
      ),
    );
  }
  
  Widget _crearEmail(LoginBloc bloc) 
  => StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container
    (
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField
      (
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration
        (
          icon: const Icon(Icons.alternate_email, color: Colors.deepPurple,),
          hintText: "ejemplo@correo.com",
          labelText: "Correo Electrónico",
          counterText: snapshot.data == null ? null : "${snapshot.data}",
          errorText: snapshot.error == null ? null : "${snapshot.error}",
        ),
        onChanged: (value) => bloc.changeEmail(value),
      ),
    );
      },
    );

   Widget _crearPassword(LoginBloc bloc) 
  => StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container
        (
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField
          (
            obscureText: true,
            //keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration
            (
              icon: const Icon(Icons.lock, color: Colors.deepPurple,),
              labelText: "Contraseña",
              counterText: snapshot.data == null ? null : "${snapshot.data}",
              errorText: snapshot.error == null ? null : "${snapshot.error}",
            ),
            onChanged: (value)=>bloc.changePassword(value),
          ),
        );
      },
    );

  
  Widget _crearBottom(LoginBloc bloc)
  => StreamBuilder(
      stream: bloc.formularioValido,
      builder: (BuildContext context, AsyncSnapshot snapshot) 
      {
        return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      ),
      onPressed: snapshot.hasData ? ()
      {
        _login(bloc);
        Navigator.pushReplacementNamed(context, "home");
      }
      :null, 
      child: Container
      (
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child:const Text("Ingresar", style: TextStyle(color: Colors.white, fontSize: 15.0))
      )
      
      );
        
      },
    );


_login(LoginBloc bloc)
{
   print("Email: ${bloc.email}");
  print("Password: ${bloc.password}");
}

}