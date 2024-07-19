import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  final String name;

  const HomeScreen({Key? key, required this.email, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: Text('Bienvenido, $email'),
      ),
    );
  }
}
