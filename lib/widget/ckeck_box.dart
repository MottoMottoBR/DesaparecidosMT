import 'package:flutter/material.dart';

import 'botao_customizado.dart';

class CaixaSelecao extends StatefulWidget {
  const CaixaSelecao({super.key});

  @override
  State<CaixaSelecao> createState() => _CaixaSelecaoState();
}

enum Sexo { masculino, feminino }

enum Status { desaparecido, localizado }

class _CaixaSelecaoState extends State<CaixaSelecao> {
  Sexo? sexoSelecionado = Sexo.masculino;
  Status? statusSelecionado = Status.desaparecido;

  // Função para imprimir as opções selecionadas
  void _imprimirOpcoes() {
    print('Opções selecionadas:');
    print('Sexo: $sexoSelecionado');
    print('Status: $statusSelecionado');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Coluna Sexo
            Expanded(
              child: RadioGroup(
                groupValue: sexoSelecionado,
                onChanged: (Sexo? value) {
                  setState(() {
                    sexoSelecionado = value;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sexo:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RadioListTile.adaptive(
                      title: const Text("Masculino"),
                      value: Sexo.masculino,
                    ),
                    RadioListTile.adaptive(
                      title: const Text("Feminino"),
                      value: Sexo.feminino,
                    ),
                  ],
                ),
              ),
            ),

            // Coluna Status
            Expanded(
              child: RadioGroup(
                groupValue: statusSelecionado,
                onChanged: (Status? value) {
                  setState(() {
                    statusSelecionado = value;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Status:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RadioListTile.adaptive(
                      title: const Text("Desaparecido"),
                      value: Status.desaparecido,
                    ),
                    RadioListTile.adaptive(
                      title: const Text("Localizado"),
                      value: Status.localizado,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
