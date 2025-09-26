import 'package:flutter/material.dart';
import 'package:myapp/models/pessoa_model.dart';
import 'package:myapp/ultis/app_styles.dart';

import '../ultis/strings.dart';
import '../widget/infoPessoa.dart';

class PessoaDetalhes extends StatelessWidget {
  final PessoasModel pessoaDetalhes;
  const PessoaDetalhes({super.key, required this.pessoaDetalhes});

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
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      pessoaDetalhes.urlFoto!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Container de status (simplificado, sem Container aninhado)
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: Colors.red,
                ),
                width: 300.0,
                height: alturaContainer,
                //Status Desaparecios ou Encontrado
                child: Center(
                  // Garante que o texto fique centralizado dentro do Container
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      StringTxT.textoDesaparecido.toUpperCase(),
                      //Style Personalizado
                      style: AppStyles.textoDesaparecidoStyle,
                    ),
                  ),
                ),
              ),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.red,
                ),
                width: 500.0,
                height: 500.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      pessoaDetalhes.urlFoto!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Espaço entre a imagem e a coluna de detalhes
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 250.0), // Adiciona o espaço do topo
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
                        //Style Personalizado
                        style: AppStyles.textoDesaparecidoStyle,
                      ),
                    ),
                  ),
                  InfoPessoa(pessoa: pessoaDetalhes),
                ],
              ),
            ],
          );

    // O Center no Scaffold garante que o layoutChildren seja centralizado na tela.
    return Scaffold(body: Center(child: layoutChildren));
  }
}
