import 'dart:ui'; // Necessário para o ImageFilter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/pessoa_model.dart';
import '../ultis/strings.dart';

class PessoaDetalhes extends StatelessWidget {
  final PessoasModel pessoaDetalhes;
  const PessoaDetalhes({super.key, required this.pessoaDetalhes});

  @override
  Widget build(BuildContext context) {
    //Tratamento de dados nulos
    final urlFoto = pessoaDetalhes.urlFoto ?? '';
    final nome = pessoaDetalhes.nome ?? "Nome Desconhecido";
    final idade = pessoaDetalhes.idade?.toString() ?? "?";
    final sexo = pessoaDetalhes.sexo ?? "Não inf.";

    //Tratamento da data
    String dataDesaparecimento = "Data desconhecida";
    if (pessoaDetalhes.ultimaOcorrencia?.dtDesaparecimento != null) {
      try {
        final dt = DateTime.parse(pessoaDetalhes.ultimaOcorrencia!.dtDesaparecimento!);
        dataDesaparecimento = DateFormat('dd/MM/yyyy').format(dt);
      } catch (e) { }
    }

    final local = pessoaDetalhes.ultimaOcorrencia?.localDesaparecimentoConcat ?? "Local não informado";
    final informacoes = pessoaDetalhes.ultimaOcorrencia?.ocorrenciaEntrevDesapDTO?.informacao ?? "Sem detalhes adicionais.";
    final vestimentas = pessoaDetalhes.ultimaOcorrencia?.ocorrenciaEntrevDesapDTO?.vestimentasDesaparecido ?? "Não informado.";

    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      extendBodyBehindAppBar: true, // Permite que a imagem de fundo suba
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.black45, // Fundo escuro atrás da seta
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Stack(
        children: [
          //CAMADA DE FUNDO (FOTO DESFOCADA)
          Positioned.fill(
            child: urlFoto.isNotEmpty
                ? Image.network(
              urlFoto,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey[900]),
            )
                : Container(color: Colors.grey[900]),
          ),
          //Efeito de Blur sobre a imagem de fundo
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.6), // Escurece o fundo
              ),
            ),
          ),

          //CONTEÚDO DA PÁGINA
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000), // Limite p/ Desktop
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: isDesktop ? 80 : 100,
                    bottom: 40,
                    left: 20,
                    right: 20
                ),
                child: Column(
                  children: [
                    //FOTO PRINCIPAL (COM SOMBRA E BORDA)
                    Hero(
                      tag: 'foto_${pessoaDetalhes.id}',
                      child: Container(
                        height: isDesktop ? 350 : 250,
                        width: isDesktop ? 350 : 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Foto redonda ou quadrada arredondada
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            )
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(urlFoto),
                            onError: (_, __) => const AssetImage('lib/imagens/user.png'), // Fallback
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    //STATUS BADGE
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.amber[700], // Cor de alerta
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        StringTxT.textoDesaparecido.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    //NOME
                    Text(
                      nome,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    //GRID DE INFORMAÇÕES RÁPIDAS
                    GridView.count(
                      crossAxisCount: isDesktop ? 4 : 2, // 4 colunas no PC, 2 no celular
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 2.5, // Deixa os cards mais achatados
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        _buildInfoChip(Icons.calendar_today, "Data", dataDesaparecimento),
                        _buildInfoChip(Icons.cake, "Idade", "$idade Anos"),
                        _buildInfoChip(Icons.person, "Sexo", sexo),
                        _buildInfoChip(Icons.location_on, "Cidade", local.split('-').last.trim()), // Tenta pegar só a cidade
                      ],
                    ),

                    const SizedBox(height: 30),

                    //CARD DE DETALHES (TEXTO LONGO)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(Icons.info_outline, "Circunstâncias"),
                          const SizedBox(height: 8),
                          Text(informacoes, style: TextStyle(color: Colors.grey[800], fontSize: 16, height: 1.5)),

                          const Divider(height: 40),

                          _buildSectionTitle(Icons.checkroom, "Vestimentas"),
                          const SizedBox(height: 8),
                          Text(vestimentas, style: TextStyle(color: Colors.grey[800], fontSize: 16)),

                          const Divider(height: 40),

                          _buildSectionTitle(Icons.map, "Local do Desaparecimento"),
                          const SizedBox(height: 8),
                          Text(local, style: TextStyle(color: Colors.grey[800], fontSize: 16)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    //BOTÕES DE AÇÃO (LIGAR / COMPARTILHAR)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[600],
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              //Adicione lógica para abrir o WhatsApp ou Share
                            },
                            icon: const Icon(Icons.share, color: Colors.white),
                            label: const Text("COMPARTILHAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800],
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              //Adicione lógica url_launcher para tel:197
                            },
                            icon: const Icon(Icons.phone, color: Colors.white),
                            label: const Text("INFORMAR PISTA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para os "Chips" de informação no topo
  Widget _buildInfoChip(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
                Text(
                  value,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget auxiliar para Títulos de Seção
  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue[800], size: 20),
        const SizedBox(width: 8),
        Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Colors.blue[800],
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}