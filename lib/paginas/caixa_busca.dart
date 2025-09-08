import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../componentes/estatisticas_widget.dart';
import '../widget/botao_customizado.dart';
import '../widget/buscar_faixa_etaria.dart';
import '../widget/ckeck_box.dart';
import '../widget/tex_form_field_custom.dart';

class Busca extends StatefulWidget {
  const Busca({super.key});

  @override
  State<Busca> createState() => _BackGroudCentralState();
}

class _BackGroudCentralState extends State<Busca> {
  final FocusNode _nomeFocusNode = FocusNode();

  @override
  void dispose() {
    _nomeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/imagens/pessoas.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(90.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: constraints.maxWidth > 500
                            ? 500
                            : constraints.maxWidth,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _nomeFocusNode.requestFocus();
                                  },
                                  child: Text(
                                    'Busca',
                                    style: GoogleFonts.abel(
                                      textStyle: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Digite as informações conhecidas para uma busca mais precisa',
                                  style: GoogleFonts.abel(
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                CustomTextField(
                                  hintText: 'Nome',
                                  labelText: 'Nome',
                                  focusNode: _nomeFocusNode,
                                ),
                                Text(
                                  'Faixa Etária:',
                                  style: GoogleFonts.abel(
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                BuscaFaixaEtaria(),
                                CaixaSelecao(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomBotao(
                                          text: 'Limpar',
                                          color: Colors.deepOrange,
                                          icon: Icons.close,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomBotao(
                                          text: 'Buscar',
                                          color: Colors.yellow,
                                          icon: Icons.search,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          EstatisticasWidget(),
        ],
      ),
    );
  }
}
