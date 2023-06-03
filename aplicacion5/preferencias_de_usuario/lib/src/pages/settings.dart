import 'package:flutter/material.dart';
import 'package:preferencias_de_usuario/src/share_pref/preferencias_usuario.dart';
import 'package:preferencias_de_usuario/src/widgets/menu.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  final prefs = PreferenciasUsuario();
  
  int? _genero;

  TextEditingController? _textController;


  @override
  void initState() {
    
    super.initState();
    
    _genero = prefs.genero;
    _textController = TextEditingController(text: prefs.usuario);

  }

  _seleccion(int? valor) {
  setState(() {
    
    prefs.genero = valor!;
    _genero = valor;
  });
}

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = "configuracion";
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.blueAccent : Colors.amberAccent, 
      ),

      drawer: MenuWidget(),

      body: SafeArea(
        child: ListView
        (
          children: 
          [
            Container
            (
              padding: const EdgeInsets.symmetric(horizontal:25.0, vertical: 10.0),
              child:   const Text("Settings",style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            const Divider(),
      
            SwitchListTile
            (
              value: prefs.colorSecundario, 
              title: const Text("Color Secundario"),
              onChanged: (value)
              {
                setState(() {
                  prefs.colorSecundario = value;
                });
              },
            ),
      
            RadioListTile
            (value: 1, 
            title: const Text("Masculino"),
            groupValue: _genero, 
            onChanged: _seleccion),
      
            RadioListTile
            (value: 2, 
            title: const Text("Femenino"),
            groupValue: _genero, 
            onChanged: _seleccion),
      
            const Divider(),
            
            Container
            (
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField
              (
                controller: _textController,
                decoration: const InputDecoration
                (
                  labelText: "Nombre",
                  helperText: "Nombre de la persona usando el teléfono"
                ),
                onChanged: (value)
                {
                  prefs.usuario = value;
                }, 
              ),
            )
            
          ],
        ),
      )
    );
  }
}