import 'package:flutter/material.dart';

class PessoaDetalhes extends StatefulWidget {
  const PessoaDetalhes({super.key});

  @override
  State<PessoaDetalhes> createState() => _PessoaDetalhesState();
}

class _PessoaDetalhesState extends State<PessoaDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          width: 500.0,
          height: 500.0,
          child: Center(child: Icon(Icons.person)),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          width: 500.0,
          height: 25.0,
          child: Center(child: Icon(Icons.person)),
        ),
      ],
    );
  }
}
