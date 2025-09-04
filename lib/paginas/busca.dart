import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componentes/tex_form_field_custom.dart';
import '../widget/buscar_faixa_etaria.dart';
import '../widget/ckeck_box.dart';

class Busca extends StatefulWidget {
  const Busca({super.key});

  @override
  State<Busca> createState() => _BackGroudCentralState();
}

class _BackGroudCentralState extends State<Busca> {
  // 1. Crie um FocusNode para controlar o foco do campo de texto
  final FocusNode _nomeFocusNode = FocusNode();

  @override
  void dispose() {
    // 2. Descarte o FocusNode quando o widget for removido para evitar vazamentos de memória
    _nomeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/imagens/pessoas.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(90.0),
        child: Row(
          children: [
            //Container Branco de Busca
            Container(
              width: 500,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // 3. Envolva o texto "Busca" com um GestureDetector
                    GestureDetector(
                      onTap: () {
                        // 4. Ao tocar no texto, solicite o foco para o FocusNode
                        _nomeFocusNode.requestFocus();
                      },
                      child: Text(
                        'Busca',
                        style: GoogleFonts.abel(
                          textStyle: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                    ),
                    Text(
                      'Digite as informações conhecidas para uma busca mais precisa',
                      style: GoogleFonts.abel(
                        textStyle: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    CustomTextField(
                      hintText: 'Nome',
                      labelText: 'Nome',
                      // 5. Associe o FocusNode ao seu CustomTextField
                      focusNode: _nomeFocusNode,
                    ),
                    Text(
                      'Faixa Etária:',
                      style: GoogleFonts.abel(
                        textStyle: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    //Resposanvel por selecionar faixa etaria
                    BuscaFaixaEtaria(),
                    // Caixa de Seleção Sexo e Estado
                    CaixaSelecao(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}