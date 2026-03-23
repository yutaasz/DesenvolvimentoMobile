import 'package:flutter/material.dart';
import 'tela1.dart';
import 'tela2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String telaAtual = "tela2"; // TEM que existir no routes

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: telaAtual,

      routes: {
        "tela1": (context) => const Tela1(),
        "tela2": (context) => const Tela2(),
      },
    );
  }
}