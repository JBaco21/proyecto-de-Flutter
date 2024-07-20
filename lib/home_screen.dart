import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _score = 0;
  bool _isGameActive = true;
  late Timer _gameTimer;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    setState(() {
      _score = 0;
      _isGameActive = true;
      _message = '';
    });
    _gameTimer = Timer(const Duration(seconds: 10), _endGame);
  }

  void _incrementScore() {
    if (_isGameActive) {
      setState(() {
        _score++;
      });
    }
  }

  void _endGame() {
    setState(() {
      _isGameActive = false;
      if (_score >= 50) {
        _message = '¡Felicidades, eres un crack!';
      } else {
        _message = 'Lástima, vuelve a intentarlo.';
      }
    });
  }

  @override
  void dispose() {
    _gameTimer.cancel();
    super.dispose();
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
              onPressed: _isGameActive ? _incrementScore : null,
              child: const Text('¡Haz clic aquí!'),
            ),
            const SizedBox(height: 20),
            Text(
              'Bienvenido, ${widget.email}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              _message,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: _message.contains('Felicidades') ? Colors.green : Colors.red,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
