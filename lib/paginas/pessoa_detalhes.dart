import 'package:flutter/material.dart';
import 'package:myapp/models/pessoa_model.dart';
// import 'package:myapp/ultis/app_styles.dart'; // Se não estiver usando, pode comentar

import '../ultis/strings.dart';
import '../widget/custom_container_foto.dart';
import '../widget/infoPessoa.dart';
import '../widget/status_indicador.dart';

class PessoaDetalhes extends StatelessWidget {
  final PessoasModel pessoaDetalhes;
  const PessoaDetalhes({super.key, required this.pessoaDetalhes});

  @override
  Widget build(BuildContext context) {
    // Pega a largura da tela para decidir o layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Define um breakpoint para a mudança de layout (1000px)
    const double breakpoint = 1000.0;

    // Lógica do Layout Responsivo
    Widget layoutChildren = screenWidth < breakpoint
        ? _buildMobileLayout() // Tela Pequena (Coluna)
        : _buildDesktopLayout(); // Tela Grande (Linha)

    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco para limpeza visual
      body: SafeArea(
        child: Stack(
          children: [
            // 1. O CONTEÚDO CENTRALIZADO
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
                child: ConstrainedBox(
                  // Limita a largura máxima no Desktop para não ficar tudo esticado
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: layoutChildren,
                ),
              ),
            ),

            // 2. O BOTÃO DE VOLTAR (Fixo no topo esquerdo)
            Positioned(
              top: 10,
              left: 10,
              child: FloatingActionButton.extended(
                heroTag: "btn_voltar",
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.blueGrey[50], // Cor suave
                elevation: 2,
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
                label: const Text(
                  "Voltar",
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Layout para Celular (Coluna) ---
  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustonContainerFoto(
          // Usa ?? '' para evitar crash se a URL for nula
          urlFoto: pessoaDetalhes.urlFoto ?? '',
        ),
        const SizedBox(height: 20),
        StatusIndicador(indicadorTitulo: StringTxT.textoDesaparecido),
        const SizedBox(height: 20),
        InfoPessoa(pessoa: pessoaDetalhes),
      ],
    );
  }

  // --- Layout para Desktop (Linha) ---
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Lado Esquerdo: Foto
        Expanded(
          flex: 4, // Proporção da foto
          child: Column(
            children: [
              CustonContainerFoto(
                urlFoto: pessoaDetalhes.urlFoto ?? '',
              ),
            ],
          ),
        ),

        const SizedBox(width: 40), // Espaço entre foto e texto

        // Lado Direito: Detalhes
        Expanded(
          flex: 6, // Proporção do texto (maior que a foto)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusIndicador(
                indicadorTitulo: StringTxT.textoDesaparecido,
              ),
              const SizedBox(height: 30),
              // Card sutil para agrupar as informações no desktop
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: InfoPessoa(pessoa: pessoaDetalhes),
              ),
            ],
          ),
        ),
      ],
    );
  }
}