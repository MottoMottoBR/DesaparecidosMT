import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/ultis/strings.dart';

class TopoPoliciaCivil extends StatelessWidget {
  const TopoPoliciaCivil({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 20), // Ajuste o padding para ser mais adaptável
        child: Wrap(
          alignment: WrapAlignment.spaceBetween, // Alinha o espaço entre os elementos
          spacing: 16.0, // Espaçamento horizontal entre os elementos
          runSpacing: 8.0, // Espaçamento vertical entre as linhas
          children: [
            // Bloco de Logo e Títulos
            Row(
              mainAxisSize: MainAxisSize.min, // Ocupa o mínimo de espaço horizontal
              children: [
                Image.asset("lib/imagens/logocivil.png", width: 80, height: 80),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringTxT.Titulo,
                      style: GoogleFonts.adamina(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      StringTxT.Titulo2,
                      style: GoogleFonts.adamina(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Bloco do Ícone e Título 3
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person_2, color: Colors.white),
                SizedBox(width: 4),
                Text(
                  StringTxT.Titulo3,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}