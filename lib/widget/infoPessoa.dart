import 'package:flutter/material.dart';
import 'package:myapp/ultis/strings.dart';

/*
  Esse arquivo mostra informações das pessoas
  ele pode ser reutilizado em outras forem nescessario
   */

class InfoPessoa extends StatefulWidget {
  const InfoPessoa({super.key});

  @override
  State<InfoPessoa> createState() => _InfoPessoaState();
}

class _InfoPessoaState extends State<InfoPessoa> {
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
      //Usa o aliamento dinamico
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Alessandro Araujo '),
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
          width: 150,
          height: 1,
          decoration: BoxDecoration(color: Colors.black38),
        ),
        const SizedBox(height: 10),
        Text(StringTxT.subTitulo),
      ],
    );
  }
}
