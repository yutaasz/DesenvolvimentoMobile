import 'package:flutter/material.dart';

class tela2 extends StatelessWidget {
  final int escolhaJogador;
  final int escolhaApp;
  final String resultado;

  const tela2({
    super.key,
    required this.escolhaJogador,
    required this.escolhaApp,
    required this.resultado,
  });

  final List<String> opcoes = const ["pedra", "papel", "tesoura"];

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
    // 🔽 definir imagem e texto do resultado
    String imagemResultado;
    String textoResultado;

    switch (resultado) {
      case "vitoria":
        imagemResultado = "assets/images/icons8-vitória-48.png";
        textoResultado = "Você venceu!";
        break;

      case "derrota":
        imagemResultado = "assets/images/icons8-perder-48.png";
        textoResultado = "Você perdeu!";
        break;

      case "empate":
        imagemResultado = "assets/images/icons8-aperto-de-mãos-100.png";
        textoResultado = "Empate!";
        break;

      default:
        imagemResultado = "";
        textoResultado = "Erro";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra, Papel, Tesoura"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(height: 30),

          // Escolha do APP
          circuloComImagem("assets/images/${opcoes[escolhaApp]}.png"),
          const SizedBox(height: 10),
          const Text(
            "Escolha do APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 30),

          // Sua escolha
          circuloComImagem("assets/images/${opcoes[escolhaJogador]}.png"),
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
            textoResultado,
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