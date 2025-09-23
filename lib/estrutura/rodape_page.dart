import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ultis/strings.dart'; // Certifique-se de que este caminho está correto

class RodapePage extends StatelessWidget {
  const RodapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black87, Colors.black45],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bloco de Logo e Títulos
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "lib/imagens/logocivil.png",
                      width: 75,
                      height: 75,
                    ),
                    SizedBox(width: 8),
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
                SizedBox(height: 5),

                // Bloco De Serviços
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Serviços',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        Text('Agenda', style: TextStyle(color: Colors.white)),
                        Text('Delegacia Digital', style: TextStyle(color: Colors.white)),
                        Text('Estatísticas', style: TextStyle(color: Colors.white)),
                        Text('Fale Corregedoria', style: TextStyle(color: Colors.white)),
                        Text('Contatos / Unidades', style: TextStyle(color: Colors.white)),
                        Text('Dicas de Segurança', style: TextStyle(color: Colors.white)),
                        Text('Fale com a PJC', style: TextStyle(color: Colors.white)),
                        Text('Fale Ouvidoria', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(
            color: Colors.white70,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              'Polícia Judiciária Civil do Estado de Mato Grosso - Copyright ©2025 - Todos os Direitos Reservados',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}