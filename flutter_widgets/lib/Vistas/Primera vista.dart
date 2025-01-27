import 'package:flutter/material.dart';
import 'package:flutter_widgets/Vistas/widget_stateless.dart';

class PrimeraVista extends StatelessWidget {
  const PrimeraVista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Stateless"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: WidgetStateless(
          nombre: "Linder Yolian Rodriguez Cortes",
          correo: "lirodirguezco@unal.edu.co",
          edad: "25",
        ),
      ),
    );
  }
}
