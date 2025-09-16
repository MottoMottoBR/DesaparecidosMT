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
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 250, right: 250),
            child: Wrap(
              children: [
                Row(
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
                    Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Serviços',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Agenda',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Delegacia Digital',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Estatísticas',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Fale Corregedoria',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Contatos / Unidades',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Dicas de Segurança',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Fale com a PJC',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Fale Ouvidoria',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
