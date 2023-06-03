
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {


  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _contrasena= "";
  String _nombre    = "";
  String _apellido  = "";
  String _email     = "";
  String _fecha     = "";
  TextEditingController controladorFecha = TextEditingController();

  List<String> cargo = ["Gerente","Porgramador Junior","Programador MID", "Pogramador Señior","Personal Administrativo"];
  String _opcionSelecionada = "Gerente";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Interacion de Inputs"),),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: 
        [
          Card(child: 
          ListTile(
            
            title: const Text("Formulario Personal"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)
            ),), 
          const Divider(),
          _crearInputNombre(),
          const Divider(),
          _crearInputApellido(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearContrasena(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearListaDesplegable(),
          const Divider(),
          _crearPersona(),

        ]),
    );

  }
  
  Widget _crearInputNombre() 
  {
    return TextField
    (
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration
      (
        
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text("Letras ${_nombre.length}"),
        helperText: "Nombres",
        labelText: "Ingrese sus nombres",
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() =>_nombre = value);
        
      },

    );
  }
  
  Widget _crearInputApellido() 
  {
    return TextField
    (
      textCapitalization : TextCapitalization.sentences,
      decoration: InputDecoration
      (
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        counter   : Text("Letras ${_apellido.length}"),
        helperText: "Apellidos",
        hintText  : "Ingrese sus Apellidos",
        suffixIcon: const Icon(Icons.accessibility_new),
        icon      : const Icon(Icons.account_box_outlined)
        
      ),
      onChanged: (value) {
        setState(() {
          _apellido = value;
        });
        
      },
    );
  }

  Widget _crearEmail() 
  {
    return TextField
    (
      keyboardType: TextInputType.emailAddress,
      decoration : InputDecoration
      (
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        helperText: "Correo Electronico",
        hintText: "Ingrese su correo",
        counterText: "Letras ${_email.length}",
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email_rounded)
      ),

      onChanged: (value) {
        setState(() {
          _email=value;
        });
      },
    );
  }

  Widget _crearContrasena() 
  {
    return TextField
    (
      obscureText: true,
      decoration: InputDecoration
      (
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        helperText: "Contraseña",
        counter: Text("Letras ${_contrasena.length}"),
        hintText: "Ingrese una contraseña de 8 digitos",
        suffixIcon: const Icon(Icons.password_rounded),
        icon: const Icon(Icons.security)
      ),
      onChanged: (value)
      {
        setState(() {_contrasena=value;});
      },
    );
  }
  
  Widget _crearFecha(context) 
  {
    return TextField
    (
      enableInteractiveSelection: false,
      controller: controladorFecha,
      decoration: InputDecoration
      (
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        helperText: "Fecha de nacimiento",
        hintText: "Establezca su fecha de nacimiento",
        suffixIcon: const Icon(Icons.calendar_today),
        icon: const Icon(Icons.calendar_month)
      ),
      onTap: ()
      {
        FocusScope.of(context).requestFocus(FocusNode());
        _selecionarFecha(context);
      },
    ); 
  }
  
  _selecionarFecha(BuildContext context) async {
   
    var fechaseleccionada = await showDatePicker
    (
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1945), 
      lastDate: DateTime(2050),
      locale: const Locale("es","PE"),
      
    );

    if (fechaseleccionada != null)
    {
      DateFormat formato = DateFormat("dd-MM-yyyy");
      _fecha = formato.format(fechaseleccionada);
      controladorFecha.text=_fecha;
    }
   }
   
List<DropdownMenuItem<String>> _crearItemlista() 
  {
    List<DropdownMenuItem<String>> lista = [];

    for (var corredor in cargo) { 
      lista.add(DropdownMenuItem(value: corredor, child: Text(corredor)));
    }
    return lista;
  }

  Widget _crearListaDesplegable()
  {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0,),
        DropdownButton
        (
          value: _opcionSelecionada,
          items: _crearItemlista(), 
          onChanged: (opt){
            setState(() {
             _opcionSelecionada=opt.toString();
            });
          } 
        ),
      ],
    );
  }
  
  _crearPersona() 
  {
    return Column(
      children: [
        ListTile(title: Text("Usuario: $_nombre $_apellido" ), subtitle: Text("Correo: $_email"),trailing: Text(_opcionSelecionada)),
        ListTile(title: Text("Fecha de nacimiento: $_fecha")),
        
      ],
    );
  }
  
 

  
  
}