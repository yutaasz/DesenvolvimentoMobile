import 'package:flutter/material.dart';

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  Widget escolhaBotao(String caminhoImagem) {
    return InkWell(
      onTap: () {
        print("Clicou em: $caminhoImagem");
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Center(
          child: Image.asset(caminhoImagem, width: 40),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra,Papel, Tesoura"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(height: 40),

          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/padrao.png",
                width: 60,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Escolha do APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              escolhaBotao("assets/images/pedra.png"),
              escolhaBotao("assets/images/papel.png"),
              escolhaBotao("assets/images/tesoura.png"),
            ],
          ),
        ],
      ),
    );
  }
}