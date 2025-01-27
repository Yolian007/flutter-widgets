import 'package:flutter/material.dart';
import 'package:flutter_widgets/Vistas/Primera%20vista.dart';
import 'package:flutter_widgets/Vistas/segunda_vista.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => const SegundaVista(),
      '/primera': (context) => PrimeraVista(),
    },
  ));
}
