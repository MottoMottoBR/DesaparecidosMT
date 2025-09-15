import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/ultis/strings.dart';

class TopoPoliciaCivil extends StatelessWidget {
  const TopoPoliciaCivil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black87, Colors.black45],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bloco de Logo e Títulos
            Row(
              children: [
                Image.asset(
                  "lib/imagens/logocivil.png",
                  width: 80,
                  height: 80,
                ),
                //espaco entre a Imagem o e O TEXO POLICIA CIVIL
                const SizedBox(width: 8),
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
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Bloco do Ícone e Título 3
            Row(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.person_2, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  StringTxT.Titulo3,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
