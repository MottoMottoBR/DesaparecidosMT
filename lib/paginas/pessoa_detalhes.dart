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
        : Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Mantém o alinhamento no topo da Row
            children: [
              // Lado esquerdo: a foto
              Expanded(
                flex: 1,
                child: CustonContainerFoto(
                  urlFoto: pessoaDetalhes.urlFoto!,
                ),
              ),

              // Lado direito: o bloco de detalhes
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                  ), // Adiciona um padding no topo
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusIndicador(
                        indicadorTitulo: StringTxT.textoDesaparecido,
                      ),
                      const SizedBox(height: 10),
                      InfoPessoa(pessoa: pessoaDetalhes),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

    // O Center no Scaffold garante que o layoutChildren seja centralizado na tela.
    return Scaffold(body: Center(child: layoutChildren));
  }
}
