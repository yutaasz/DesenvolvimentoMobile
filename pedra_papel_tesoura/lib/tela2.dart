import 'package:flutter/material.dart';
import 'dart:math';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  Widget circuloComImagem(String caminhoImagem) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Center(
        child: Image.asset(caminhoImagem, width: 60),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> opcoes = ["pedra", "papel", "tesoura"];
    // 🔽 SUA ESCOLHA (troca manualmente se quiser testar)
    final String suaEscolha = "pedra";

    // 🔽 escolha aleatória do app
    final String escolhaApp = opcoes[Random().nextInt(3)];

    // 🔽 lógica do jogo
    String resultado;
    String imagemResultado;

    if (suaEscolha == escolhaApp) {
      resultado = "Empate";
      imagemResultado = "assets/images/icons8-aperto-de-mãos-100.png";
    } else if (
    (suaEscolha == "pedra" && escolhaApp == "tesoura") ||
        (suaEscolha == "papel" && escolhaApp == "pedra") ||
        (suaEscolha == "tesoura" && escolhaApp == "papel")) {
      resultado = "Você venceu";
      imagemResultado = "assets/images/icons8-vitória-48.png";
    } else {
      resultado = "Você perdeu";
      imagemResultado = "assets/images/icons8-perder-48.png";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra,Papel, Tesoura"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(height: 30),

          // Escolha do APP
          circuloComImagem("assets/images/$escolhaApp.png"),
          const SizedBox(height: 10),
          const Text(
            "Escolha do APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 30),

          // Sua escolha
          circuloComImagem("assets/images/$suaEscolha.png"),
          const SizedBox(height: 10),
          const Text(
            "Sua Escolha",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 30),

          // Resultado
          Image.asset(imagemResultado, width: 100),

          const SizedBox(height: 10),

          Text(
            resultado,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 12,
              ),
            ),
            child: const Text("Jogar novamente"),
          ),
        ],
      ),
    );
  }
}