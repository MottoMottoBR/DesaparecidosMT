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
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          // A linha principal é um Row que irá se adaptar a uma Column em telas pequenas
          if (constraints.maxWidth > 800) {
            return _buildWideLayout(constraints);
          } else {
            return _buildNarrowLayout();
          }
        },
      ),
    );
  }

  Widget _buildWideLayout(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // O Card de busca (lado esquerdo)
        SizedBox(
          width: 500, // Largura fixa para telas grandes
          child: _buildSearchCard(),
        ),
        // O Widget de estatísticas (lado direito)
       // Expanded(child: EstatisticasWidget()),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            // O Card de busca
            _buildSearchCard(),
            const SizedBox(height: 20),
            // O Widget de estatísticas
            EstatisticasWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
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
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Digite as informações conhecidas para uma busca mais precisa',
                textAlign: TextAlign.center,
                style: GoogleFonts.abel(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Nome',
              labelText: 'Nome',
              controller: _controller,
            ),
            const SizedBox(height: 16),
            Text(
              'Faixa Etária:',
              style: GoogleFonts.abel(
                textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const BuscaFaixaEtaria(),
            const SizedBox(height: 16),
            const CaixaSelecao(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomBotao(
                      text: 'Limpar',
                      color: Colors.deepOrange,
                      icon: Icons.close,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomBotao(
                      text: 'Buscar',
                      color: Colors.yellow,
                      icon: Icons.search,
                      onPressed: () {
                        print(_controller.text);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}