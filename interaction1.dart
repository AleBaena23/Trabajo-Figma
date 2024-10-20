import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Control de Opacidad'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 1.0; // Valor inicial de la opacidad de la imagen
  bool _isWindowActive = false;

  void _startOpacityWindow() {
    setState(() {
      _isWindowActive = true;
    });

    // Desactiva la ventana después de 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isWindowActive = false;
      });
    });
  }

  void _decreaseOpacity() {
    if (_isWindowActive && _opacity > 0.0) {
      setState(() {
        _opacity = (_opacity - 0.1).clamp(0.0, 1.0); // Reduce la opacidad un 10% por toque
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _decreaseOpacity, // Detecta el toque en cualquier parte de la pantalla
      child: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: _opacity,
              child: Image.asset(
                'assets/my_image.png', // Asegúrate de tener la imagen en esta ruta
                width: 200,
                height: 200,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _startOpacityWindow,
                child: Text('Abrir ventana de 3 segundos'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
