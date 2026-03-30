import 'package:flutter/material.dart';
import 'dart:math';
import 'tela2.dart';

class tela1 extends StatelessWidget {
  const tela1({super.key});

  final List<String> opcoes = const ["pedra", "papel", "tesoura"];

  String verificarResultado(int jogador, int app) {
    if (jogador == app) return "empate";

    switch (jogador) {
      case 0: // pedra
        return (app == 2) ? "vitoria" : "derrota";
      case 1: // papel
        return (app == 0) ? "vitoria" : "derrota";
      case 2: // tesoura
        return (app == 1) ? "vitoria" : "derrota";
      default:
        return "erro";
    }
  }

  void jogar(BuildContext context, int escolhaJogador) {
    final random = Random();
    int escolhaApp = random.nextInt(3);

    String resultado = verificarResultado(escolhaJogador, escolhaApp);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => tela2(
          escolhaJogador: escolhaJogador,
          escolhaApp: escolhaApp,
          resultado: resultado,
        ),
      ),
    );
  }

  Widget escolhaBotao(BuildContext context, int index) {
    return InkWell(
      onTap: () => jogar(context, index),
      borderRadius: BorderRadius.circular(50),
      child: ClipOval(
        child: Image.asset(
          "assets/images/${opcoes[index]}.png",
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra, Papel, Tesoura"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(height: 40),

          // imagem padrão do app
          ClipOval(
            child: Image.asset(
              "assets/images/padrao.png",
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Escolha do APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              escolhaBotao(context, 0),
              escolhaBotao(context, 1),
              escolhaBotao(context, 2),
            ],
          ),
        ],
      ),
    );
  }
}