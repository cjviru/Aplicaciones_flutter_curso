import 'package:flutter/material.dart';
class HomePageTemp extends StatelessWidget {

  final opciones = ["Uno","Dos","Tres","Cuatro","Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Componentes Temp"),
      ),

      body: ListView
      (
         children: _crearItemCorta(),
      ),

    );
  }


List<Widget> _crearItem()
{
  List<Widget> lista = <Widget>[];
  for (var opt in opciones) 
  {
    final tempwidget = ListTile
    (
      title: Text(opt),
    );
    lista..add(tempwidget)
         ..add(const Divider());

  }

  return lista;
}

List<Widget> _crearItemCorta()
{
  var widgets = opciones.map((item) =>Column(
    children: <Widget>[
      ListTile
      (
        title: Text("$item !"),
        subtitle: const Text("Prederminado"),
        leading: const Icon(Icons.accessibility),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: (){},
      ),

      const Divider()

    ],
  ) ).toList();

  return widgets;
}

}