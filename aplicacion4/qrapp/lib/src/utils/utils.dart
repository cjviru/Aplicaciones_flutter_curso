

import 'package:flutter/material.dart';
import 'package:qrapp/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

 abrirScan(ScanModel scan, BuildContext context) async {
  if (scan.tipo == 'http') 
  {
    // ignore: deprecated_member_use
    if (!await canLaunch(scan.valor)) {
    // ignore: deprecated_member_use
    await launch(scan.valor);
    } else {
      throw 'Could not launch ${scan.valor}';
    }
  } 
  else 
  {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
  
  
}