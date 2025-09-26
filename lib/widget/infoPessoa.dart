import 'package:flutter/material.dart';
import 'package:myapp/models/pessoa_model.dart';
import 'package:myapp/ultis/strings.dart';

/*
  Esse arquivo mostra informações das pessoas
  ele pode ser reutilizado em outras forem nescessario
   */

class InfoPessoa extends StatelessWidget {
  final PessoasModel pessoa;
  const InfoPessoa({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    //Pega a largura da tela para decidir o layout
    final screenWidth = MediaQuery.of(context).size.width;
    const double beackpoint = 800.0;

    //define o alinhamento para : CENTER para telas PEQUENAS, Start para telas GRANDES
    final alignment = screenWidth < beackpoint
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    return Column(
      //Usa o alinhamento dinamico
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Nome: ${pessoa.nome}'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Idade: ${StringTxT.pessoaIdade}'),
            SizedBox(width: 4),
            Text(StringTxT.pessoaSexo),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: 250,
          height: 1,
          decoration: BoxDecoration(color: Colors.black38),
        ),
        const SizedBox(height: 10),
        Text(StringTxT.subTitulo),
      ],
    );
  }
}
