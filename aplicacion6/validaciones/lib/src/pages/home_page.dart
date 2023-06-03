import 'package:flutter/material.dart';
import 'package:validaciones/src/Blocs/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Home Page")
      ),
      body: Center(
        child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
          [
            Text("Email: ${bloc.email}"),
            Text("Passowrd: ${bloc.password}")    
          ]),
      ),
    );
  }
}