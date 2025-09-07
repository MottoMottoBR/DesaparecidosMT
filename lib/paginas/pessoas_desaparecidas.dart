import 'package:flutter/material.dart';
import '../api_service/api_repository.dart';
import '../models/pessoa_model.dart';

class PessoasDesaparecidas extends StatefulWidget {
  const PessoasDesaparecidas({super.key});

  @override
  State<PessoasDesaparecidas> createState() => _PessoasDesaparecidasState();
}

class _PessoasDesaparecidasState extends State<PessoasDesaparecidas> {
  // Criauma instância do seu repositório
  final ApiRepositorio _apiRepositorio = ApiRepositorio();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PessoasModel>>(
      future: _apiRepositorio.getPessoas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Erro ao carregar os dados: ${snapshot.error}'),
          );
        }

        // Exibe a lista se os dados estiverem disponíveis
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final listaDePessoas = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
              crossAxisSpacing: 2, // Espaçamento horizontal
              mainAxisSpacing: 2, // Espaçamento vertical
              childAspectRatio:
                  0.5, // Proporção da largura pela altura de cada item
            ),

            itemCount: listaDePessoas.length,
            itemBuilder: (BuildContext context, int index) {
              final pessoa = listaDePessoas[index];
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    print("Clicou na pessoa, ${ pessoa.nome}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 3),
                      ),
                      width: 150,
                      height: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          pessoa.urlFoto != null
                              ? Image.network(
                                  height: 250,
                                  width: double.infinity,
                                  pessoa.urlFoto!,
                                  fit: BoxFit.cover,
                                )
                              : Icon(Icons.person, size: 40),

                          //Nome da Pessoa Desaparecida
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              top: 2,
                              right: 2,
                              bottom: 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pessoa.nome!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${(pessoa.idade!)} anos, ${(pessoa.sexo!)}',
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                                ),
                                SizedBox(height: 20),

                                Text(
                                  'Data: ${(pessoa.ultimaOcorrencia?.dtDesaparecimento != null ? pessoa.ultimaOcorrencia!.dtDesaparecimento!.substring(0, 10) : 'Não informada')}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Local: ${(pessoa.ultimaOcorrencia?.localDesaparecimentoConcat)}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),

                          //Data de Nascimento da Pessoa
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }

        // Se não houver dados
        return const Center(
          child: Text('Nenhuma pessoa desaparecida encontrada.'),
        );
      },
    );
  }
}
