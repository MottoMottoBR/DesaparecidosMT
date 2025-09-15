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
  late Future<List<PessoasModel>> futurePessoasModel;
  final apiService = ApiRepositorio();
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    futurePessoasModel = apiService.getPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PessoasModel>>(
      future: futurePessoasModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final pessoas = snapshot.data!;
          if (pessoas.isEmpty) {
            return const Text('Nenhuma pessoa encontrada');
          }

          return Wrap(
            spacing: 16.0, // Espaço horizontal entre os cards
            runSpacing: 16.0, // Espaço vertical entre as linhas
            alignment: WrapAlignment.center, // Centraliza os cards
            children: pessoas.map((pessoa) {
              // 1. Converte a string da API para um objeto DateTime
              final dtDesaparecimento = DateTime.parse(
                pessoa.ultimaOcorrencia!.dtDesaparecimento!,
              );

              // 2. Formata o objeto DateTime para o formato desejado (dd/MM/yyyy)
              final dataFormatada = DateFormat(
                'dd/MM/yyyy',
              ).format(dtDesaparecimento);

              return MouseRegion(
                onEnter: (event) {
                  setState(() {
                    _hoveredIndex = pessoas.indexOf(pessoa);
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
                  },
                  child: SizedBox(
                    width: 300.0,
                    height:
                        490.0, // Largura fixa de cada card, eles se ajustarão automaticamente.
                    child: Card(
                      elevation: _hoveredIndex == pessoas.indexOf(pessoa)
                          ? 8
                          : 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          if (pessoa.urlFoto != null &&
                              pessoa.urlFoto!.isNotEmpty)
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
                                  height: 250, // Altura fixa da imagem
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                Text(
                                  pessoa.nome ?? "Sem Nome",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${pessoa.idade} Anos, ${pessoa.sexo} ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Data: $dataFormatada ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }
        return const Text('Nenhum dado disponível.');
      },
    );
  }
}
