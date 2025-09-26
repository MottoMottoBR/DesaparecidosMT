import 'package:flutter/material.dart';

import '../ultis/strings.dart';
import '../widget/infoPessoa.dart';

class PessoaDetalhes extends StatelessWidget {
  const PessoaDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    //define o tamanho dos Containet AZUL
    const double alturaContainer = 40.0;

    // Pega a largura da tela para decidir o layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Define um breakpoint para a mudança de layout
    const double breakpoint = 800.0;

    /*
       PARA TELAS ***Pequena*** SERA RENDERIZADO ESSE BLOCO DE CODIGO
     */
    Widget layoutChildren = screenWidth < breakpoint
        ? Column(
            // Em telas pequenas, eles ficam um abaixo do outro
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  color: Colors.red,
                ),
                width: 300.0,
                height: alturaContainer,
                child: const Center(child: Text(StringTxT.textoDesaparecido)),
              ),
              InfoPessoa(),
            ],
          )
        : Row(
            /*
                PARA TELAS **GRANDE**** SERA RENDERIZADO ESSE BLOCO DE CODIGO
              */

            // bloco com o Container que vai receber a imagem da pessoa
            crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50.0), // Adiciona o espaço do topo
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.red,
                    ),
                    width: 240.0,
                    height: alturaContainer,
                    //Status Desaparecios ou Encontrado
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        StringTxT.textoDesaparecido.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  InfoPessoa(),
                ],
              ),
            ],
          );

    return Scaffold(body: layoutChildren);
  }
}
