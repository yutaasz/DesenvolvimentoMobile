import 'package:flutter/material.dart';
import 'confirmacao_page.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final emailController = TextEditingController();

  String? sexoSelecionado;
  bool termosAceitos = false;

  final _focusIdade = FocusNode();
  final _focusEmail = FocusNode();

  void validarCadastro() {
    String nome = nomeController.text.trim();
    String idadeStr = idadeController.text.trim();
    String email = emailController.text.trim();

    if (nome.isEmpty) {
      mostrarErro("Nome não pode ser vazio");
      return;
    }

    if (idadeStr.isEmpty) {
      mostrarErro("Idade não pode ser vazia");
      return;
    }

    int idade;
    try {
      idade = int.parse(idadeStr);
    } catch (e) {
      mostrarErro("Idade deve ser um número");
      return;
    }

    if (idade < 18) {
      mostrarErro("Você deve ter pelo menos 18 anos");
      return;
    }

    if (email.isEmpty || !email.contains("@") || !email.contains(".")) {
      mostrarErro("Email inválido");
      return;
    }

    if (sexoSelecionado == null) {
      mostrarErro("Selecione o sexo");
      return;
    }

    if (!termosAceitos) {
      mostrarErro("Aceite os termos");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ConfirmacaoPage(
          nome: nome,
          idade: idade,
          email: email,
          sexo: sexoSelecionado!,
          termos: termosAceitos,
        ),
      ),
    );
  }

  void mostrarErro(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  InputDecoration estiloCampo(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                const Text(
                  "Preencha os campos abaixo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: nomeController,
                  decoration: estiloCampo("Nome"),
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusIdade);
                  },
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: idadeController,
                  focusNode: _focusIdade,
                  keyboardType: TextInputType.number,
                  decoration: estiloCampo("Idade"),
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusEmail);
                  },
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: emailController,
                  focusNode: _focusEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: estiloCampo("Email"),
                  textInputAction: TextInputAction.done,
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  value: sexoSelecionado,
                  decoration: estiloCampo("Sexo"),
                  items: ["Masculino", "Feminino", "Outro"]
                      .map((sexo) => DropdownMenuItem(
                    value: sexo,
                    child: Text(sexo),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      sexoSelecionado = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    Checkbox(
                      value: termosAceitos,
                      onChanged: (value) {
                        setState(() {
                          termosAceitos = value!;
                        });
                      },
                    ),
                    const Text("Aceito os termos de uso"),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: validarCadastro,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}