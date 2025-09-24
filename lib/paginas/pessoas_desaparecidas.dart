import 'package:flutter/material.dart';
import 'package:myapp/api_service/api_repository.dart';
import '../models/pessoa_model.dart';
import 'package:intl/intl.dart';

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
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final pessoas = snapshot.data!;
          final int startIndex = (_paginaAtual - 1) * _pessoasPorPagina;
          int endIndex = startIndex + _pessoasPorPagina;
          if (endIndex > pessoas.length) {
            endIndex = pessoas.length;
          }

          if (pessoas.isEmpty) {
            return const Center(child: Text('Nenhuma pessoa encontrada'));
          }

          final List<PessoasModel> pessoasDaPagina = pessoas.sublist(
            startIndex,
            endIndex,
          );

          final int totalPaginas = (pessoas.length / _pessoasPorPagina).ceil();

          return Column(
            children: [
              // A lista de itens deve ser o SingleChildScrollView para permitir a rolagem.
              // Removemos o Expanded aqui.
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    alignment: WrapAlignment.center,
                    children: pessoasDaPagina.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final PessoasModel pessoa = entry.value;

                      final dtDesaparecimento = DateTime.parse(
                        pessoa.ultimaOcorrencia!.dtDesaparecimento!,
                      );

                      final dataFormatada = DateFormat(
                        'dd/MM/yyyy',
                      ).format(dtDesaparecimento);

                      return MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            _hoveredIndex = index;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            _hoveredIndex = null;
                          });
                        },
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            print(pessoa.nome);
                            print(pessoa.idade);
                            print(pessoa.sexo);
                            print(pessoa.ultimaOcorrencia!.localDesaparecimentoConcat);
                          },
                          child: SizedBox(
                            width: 300.0,
                            height: 490.0,
                            child: Card(
                              elevation: _hoveredIndex == index ? 50 : 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (pessoa.urlFoto != null && pessoa.urlFoto!.isNotEmpty)
                                    AspectRatio(
                                      aspectRatio: 1 / 1,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        child: Image.network(
                                          pessoa.urlFoto!,
                                          fit: BoxFit.cover,
                                          height: 250,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Image.asset(
                                              'lib/imagens/user.png',
                                              fit: BoxFit.cover,
                                              height: 250,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            pessoa.nome ?? "Sem Nome",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${pessoa.idade} Anos, ${pessoa.sexo} ',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 13),
                                          ),
                                          const SizedBox(height: 15),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: 'Data: ',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text: dataFormatada,
                                                  style: const TextStyle(fontWeight: FontWeight.w100),
                                                ),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: 'Local: ',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text: pessoa.ultimaOcorrencia!.localDesaparecimentoConcat,
                                                  style: const TextStyle(fontWeight: FontWeight.w100),
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
              const SizedBox(height: 20),
              // A barra de paginação deve ficar fora do SingleChildScrollView para permanecer fixa.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _paginaAtual > 1
                        ? () => _mudarPagina(_paginaAtual - 1)
                        : null,
                    child: const Text('Anterior'),
                  ),
                  const SizedBox(width: 20),
                  Text('Página $_paginaAtual de $totalPaginas'),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _paginaAtual < totalPaginas
                        ? () => _mudarPagina(_paginaAtual + 1)
                        : null,
                    child: const Text('Próximo'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}