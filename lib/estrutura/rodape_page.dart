import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ultis/strings.dart';

class RodapePage extends StatelessWidget {
  const RodapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black87, Colors.black45],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 250, right: 250),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bloco de Logo e Títulos
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "lib/imagens/logocivil.png",
                      width: 75,
                      height: 75,
                    ),
                    //espaco entre a Imagem o e O TEXO POLICIA CIVIL
                    SizedBox(width: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringTxT.Titulo,
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                          StringTxT.Titulo2,
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Bloco De Serviços
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Serviços',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Agenda'),
                        SizedBox(width: 10),
                        Text('Delegacia Digital'),
                        SizedBox(width: 10),
                        Text('Estatísticas'),
                        SizedBox(width: 10),
                        Text('Fale Corregedoria'),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Contatos / Unidades'),
                        SizedBox(width: 10),
                        Text('Dicas de Segurança'),
                        SizedBox(width: 10),
                        Text('Fale com a PJC'),
                        SizedBox(width: 10),
                        Text('Fale Ouvidoria'),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
