import 'package:flutter/material.dart';

class PessoaDetalhes extends StatelessWidget {
  const PessoaDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    // Pega a largura da tela para decidir o layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Define um breakpoint para a mudança de layout
    const double breakpoint = 800.0;

    // Retorna um Column para telas menores e um Row para telas maiores
    Widget layoutChildren = screenWidth < breakpoint
        ? Column(
      // Em telas pequenas, eles ficam um abaixo do outro
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
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
        // NÃO adiciona espaço vertical em telas pequenas
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(3),
              bottomLeft: Radius.circular(3),
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
      // Em telas grandes, eles ficam um ao lado do outro
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start, // Alinha os filhos no topo
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
        // Usa um Column para controlar o espaço vertical do container azul
        Column(
          children: [
            const SizedBox(height: 50.0), // Adiciona o espaço do topo
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
              //Status Desaparecios ou Encontrado
              child: const Center(child: Text('Desaparecidos')),
            ),
          ],
        )
      ],
    );

    return Center(child: layoutChildren);
  }
}
