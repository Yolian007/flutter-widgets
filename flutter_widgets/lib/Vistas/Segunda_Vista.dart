import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SegundaVista extends StatefulWidget {
  const SegundaVista({super.key});

  @override
  _SegundaVistaState createState() => _SegundaVistaState();
}

class _SegundaVistaState extends State<SegundaVista> {
  String _imagePath = "";

  @override
  void initState() {
    super.initState();
    _loadImageFromPreferences();
  }

  Future<void> _loadImageFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = prefs.getString('background_image') ??
          'assets/images/6.jpg'; // Imagen por defecto
    });
  }

  Future<void> _saveImageToPreferences(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('background_image', imagePath);
    setState(() {
      _imagePath = imagePath;
    });
  }

  // Mostrar modal de configuración
  void _showConfigurationModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Selecciona una imagen",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...List.generate(6, (index) {
                final imagePath = 'assets/images/${index + 1}.jpg';
                return ListTile(
                  leading: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text("Imagen ${index + 1}"),
                  onTap: () async {
                    await _saveImageToPreferences(imagePath);
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _imagePath.isNotEmpty
                ? Image.asset(
                    _imagePath,
                    fit: BoxFit.cover,
                  )
                : const SizedBox.shrink(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Configuración de Imagen",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showConfigurationModal,
                  child: const Text("Configurar Imagen"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la Primera Vista
                    Navigator.pushNamed(context, '/primera');
                  },
                  child: const Text("Widget Stateless"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
