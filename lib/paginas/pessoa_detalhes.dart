import 'package:flutter/material.dart';
import 'package:myapp/models/pessoa_model.dart';
import 'package:myapp/ultis/app_styles.dart';

import '../ultis/strings.dart';
import '../widget/custom_container_foto.dart';
import '../widget/infoPessoa.dart';
import '../widget/status_indicador.dart';

class PessoaDetalhes extends StatelessWidget {
  final PessoasModel pessoaDetalhes;
  const PessoaDetalhes({super.key, required this.pessoaDetalhes});

  @override
  Widget build(BuildContext context) {
    double alturaContainer = 40.0;

    // Pega a largura da tela para decidir o layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Define um breakpoint para a mudança de layout
    const double breakpoint = 1000.0;

    /*
       PARA TELAS ***Pequena*** SERA RENDERIZADO ESSE BLOCO DE CODIGO
     */
    Widget layoutChildren = screenWidth < breakpoint
        ? Column(
            // Em telas pequenas, eles ficam um abaixo do outro
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustonContainerFoto(urlFoto: pessoaDetalhes.urlFoto!),

              // Container de status (simplificado, sem Container aninhado)
              StatusIndicador(indicadorTitulo: StringTxT.textoDesaparecido),
              // Adiciona um padding para distanciar o bloco de informações
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: InfoPessoa(pessoa: pessoaDetalhes),
              ),
            ],
          )
        : Row(
            /*
                PARA TELAS **GRANDE**** SERA RENDERIZADO ESSE BLOCO DE CODIGO
              */
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // bloco com o Container que vai receber a imagem da pessoa
              CustonContainerFoto(urlFoto: pessoaDetalhes.urlFoto!),

              // Espaço entre a imagem e a coluna de detalhes
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 250.0), // Adiciona o espaço do topo
                  //indicador de statatus
                  StatusIndicador(indicadorTitulo: StringTxT.textoDesaparecido),

                  //Parte de detalhes da pessoa
                  InfoPessoa(pessoa: pessoaDetalhes),
                ],
              ),
            ],
          );

    // O Center no Scaffold garante que o layoutChildren seja centralizado na tela.
    return Scaffold(body: Center(child: layoutChildren));
  }
}
