
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer
    (
      child: ListView
      (
        padding: EdgeInsets.zero,
        children: 
        [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/menu-img.jpg'),
                fit: BoxFit.cover
              )
              
            ),
            child:Container
            (
              
            )
          ),

        //Opciones del menú
        ListTile
        (
          leading: const Icon(Icons.pages, color: Colors.blueAccent),
          title: const Text("Home"),
          onTap: ()
          {
            Navigator.pushReplacementNamed(context,"home");
          },
        ),
        ListTile
        (
          leading: const Icon(Icons.people, color: Colors.blueAccent),
          title: const Text("People"),
          onTap: ()
          {

          },
        ),
        ListTile
        (
          leading: const Icon(Icons.party_mode, color: Colors.blueAccent),
          title: const Text("Party Mode"),
          onTap: ()
          {

          },
        ),
        ListTile
        (
          leading: const Icon(Icons.settings, color: Colors.blueAccent),
          title: const Text("Settings"),
          onTap: ()
          {
            Navigator.pushReplacementNamed(context,"configuracion");
          },
        )
      ]));
  }
}