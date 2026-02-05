import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/api_service/api_repository.dart';
import 'package:myapp/paginas/pessoa_detalhes.dart';
import '../models/pessoa_model.dart';

class PessoasDesaparecidas extends StatefulWidget {
  const PessoasDesaparecidas({super.key});

  @override
  State<PessoasDesaparecidas> createState() => _PessoasDesaparecidasState();
}

class _PessoasDesaparecidasState extends State<PessoasDesaparecidas> {
  int _paginaAtual = 1;
  final int _pessoasPorPagina = 12;
  late Future<List<PessoasModel>> futurePessoasModel;

  final apiService = ApiRepositorio();
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    futurePessoasModel = apiService.getPessoas();
  }

  void _mudarPagina(int novaPagina) {
    setState(() {
      _paginaAtual = novaPagina;
      _hoveredIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PessoasModel>>(
      future: futurePessoasModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Define uma altura fixa para o loading não colapsar a tela
          return const SizedBox(
            height: 400,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SizedBox(
            height: 400,
            child: Center(child: Text('Erro ao carregar dados: ${snapshot.error}')),
          );
        } else if (snapshot.hasData) {
          final pessoas = snapshot.data!;

          if (pessoas.isEmpty) {
            return const SizedBox(
              height: 400,
              child: Center(child: Text('Nenhuma pessoa encontrada')),
            );
          }

          // Lógica de Paginação
          final int startIndex = (_paginaAtual - 1) * _pessoasPorPagina;
          int endIndex = startIndex + _pessoasPorPagina;
          if (endIndex > pessoas.length) {
            endIndex = pessoas.length;
          }

          final List<PessoasModel> pessoasDaPagina = pessoas.sublist(
            startIndex,
            endIndex,
          );

          final int totalPaginas = (pessoas.length / _pessoasPorPagina).ceil();

          return Column(
            children: [
              // CORREÇÃO: Removemos Expanded e SingleChildScrollView aqui.
              // O widget agora apenas ocupa o espaço necessário.
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    alignment: WrapAlignment.center,
                    children: pessoasDaPagina.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final PessoasModel pessoa = entry.value;

                      String dataFormatada = 'Data desconhecida';
                      if (pessoa.ultimaOcorrencia?.dtDesaparecimento != null) {
                        try {
                          final dt = DateTime.parse(pessoa.ultimaOcorrencia!.dtDesaparecimento!);
                          dataFormatada = DateFormat('dd/MM/yyyy').format(dt);
                        } catch (e) {
                          // Data inválida
                        }
                      }

                      return MouseRegion(
                        onEnter: (_) => setState(() => _hoveredIndex = index),
                        onExit: (_) => setState(() => _hoveredIndex = null),
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PessoaDetalhes(pessoaDetalhes: pessoa),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 300.0,
                            height: 490.0,
                            child: Card(
                              elevation: _hoveredIndex == index ? 10 : 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: Image.network(
                                        pessoa.urlFoto ?? '',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return const Center(
                                            child: CircularProgressIndicator(strokeWidth: 2),
                                          );
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            'lib/imagens/user.png',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                color: Colors.grey[200],
                                                width: double.infinity,
                                                child: const Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.person, size: 50, color: Colors.grey),
                                                    Text("Sem foto", style: TextStyle(color: Colors.grey))
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SizedBox(
                                      // Definimos uma altura fixa para o conteúdo de texto para evitar desalinhamento
                                      height: 140,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            pessoa.nome ?? "Sem Nome",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '${pessoa.idade ?? "?"} Anos, ${pessoa.sexo ?? "Não informado"}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 13,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Divider(),
                                          RichText(
                                            text: TextSpan(
                                              style: const TextStyle(color: Colors.black87, fontSize: 13),
                                              children: [
                                                const TextSpan(
                                                  text: 'Desapareceu em: ',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                TextSpan(text: dataFormatada),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          RichText(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                              style: const TextStyle(color: Colors.black87, fontSize: 13),
                                              children: [
                                                const TextSpan(
                                                  text: 'Local: ',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text: pessoa.ultimaOcorrencia?.localDesaparecimentoConcat ?? "Não informado",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Barra de Paginação
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Colors.grey[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _paginaAtual > 1
                          ? () => _mudarPagina(_paginaAtual - 1)
                          : null,
                      child: const Text('Anterior'),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Página $_paginaAtual de $totalPaginas',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _paginaAtual < totalPaginas
                          ? () => _mudarPagina(_paginaAtual + 1)
                          : null,
                      child: const Text('Próximo'),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}