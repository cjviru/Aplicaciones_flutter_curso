import 'package:flutter/material.dart';
import 'package:qrapp/src/bloc/scans_bloc.dart';
import 'package:qrapp/src/models/scan_model.dart';
import 'package:qrapp/src/providers/db_provider.dart';
import 'package:qrapp/src/utils/utils.dart' as utils;
import 'package:qrscan/qrscan.dart';
class MapaScreen extends StatelessWidget {
  MapaScreen({super.key});

  final scansBloc = ScansBloc();

  @override
  Widget build(BuildContext context) {
  //obtener el stream de los scans
    scansBloc.obtenerScans();

    return StreamBuilder(
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData)
        {
          return const CircularProgressIndicator();
        }

        final scans = snapshot.data;

        if (scans!.length == 0)
        {
          return const Center(child: Text("No hay información"));
        }
        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context,i) => 
          
          //Dismissible es un widget que me permite deslizar un elemento de la lista y eliminarlo 
          Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red,),
            onDismissed: (direction) => scansBloc.borrarScans(scans[i].id!),
            child: ListTile
            (
              leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
              title: Text("${scans[i].valor}"),
              subtitle: Text("ID: ${scans[i].id}"),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: ()
              {
                utils.abrirScan(scans[i], context);
                
              },
            ),
          ),
          );

      },
    );
  }
}