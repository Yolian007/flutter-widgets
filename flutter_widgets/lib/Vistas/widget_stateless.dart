import 'package:flutter/material.dart';

class WidgetStateless extends StatelessWidget {
  final String nombre;
  final String correo;
  final String edad;

  const WidgetStateless({
    super.key,
    required this.nombre,
    required this.correo,
    required this.edad,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nombre: $nombre",
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Text(
          "Correo: $correo",
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Text(
          "Edad: $edad",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
