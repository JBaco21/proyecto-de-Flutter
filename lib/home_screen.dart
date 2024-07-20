import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _score = 0;

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Clicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Puntos: $_score',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementScore,
              child: const Text('¡Haz clic aquí!'),
            ),
            const SizedBox(height: 20),
            Text(
              'Bienvenido, ${widget.email}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
