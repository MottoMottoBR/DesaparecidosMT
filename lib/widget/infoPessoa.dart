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
    return Column(
      children: [
        Text(StringTxT.pessoaNome),
        Row(
          children: [
            Text('Idade: ${StringTxT.pessoaIdade}'),
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
