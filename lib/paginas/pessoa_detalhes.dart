import 'package:flutter/material.dart';

class PessoaDetalhes extends StatefulWidget {
  const PessoaDetalhes({super.key});

  @override
  State<PessoaDetalhes> createState() => _PessoaDetalhesState();
}

class _PessoaDetalhesState extends State<PessoaDetalhes> {
  @override
  Widget build(BuildContext context) {
    // Pega a largura da tela para decidir o layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Define um breakpoint para a mudança de layout
    const double breakpoint = 800.0;

    // Retorna um Column para telas menores e um Row para telas maiores
    Widget layoutChildren = screenWidth < breakpoint
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente os filhos
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.red,
          ),
          width: 500.0,
          height: 500.0,
          child: const Center(child: Icon(Icons.person)),
        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(3),
              topRight: Radius.circular(3),
            ),
            color: Colors.blue,
          ),
          width: 300.0,
          height: 25.0,
          child: const Center(child: Icon(Icons.person)),
        ),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.red,
          ),
          width: 500.0,
          height: 500.0,
          child: const Center(child: Icon(Icons.person)),
        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(3),
              topRight: Radius.circular(3),
            ),
            color: Colors.blue,
          ),
          width: 300.0,
          height: 25.0,
          child: const Center(child: Icon(Icons.person)),
        ),
      ],
    );

    return Center(child: layoutChildren);
  }
}
