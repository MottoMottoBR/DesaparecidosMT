import 'package:flutter/material.dart';
import 'package:myapp/paginas/pessoas_detalhes.dart';
import '../api_service/api_repository.dart';
import '../models/pessoa_model.dart';

class PessoasDesaparecidas extends StatefulWidget {
  final List<PessoasModel>? pessoas;
  const PessoasDesaparecidas({super.key, this.pessoas});

  @override
  State<PessoasDesaparecidas> createState() => _PessoasDesaparecidasState();
}

class _PessoasDesaparecidasState extends State<PessoasDesaparecidas> {
  // Cria uma instância do seu repositório
  final ApiRepositorio _apiRepositorio = ApiRepositorio();
  late Future<List<PessoasModel>> _futurePessoas;

  @override
  void initState() {
    super.initState();
    if (widget.pessoas != null) {
      _futurePessoas = Future.value(widget.pessoas!);
    } else {
      _futurePessoas = _apiRepositorio.getPessoas();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PessoasModel>>(
      future: _apiRepositorio.getPessoas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
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

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
              crossAxisSpacing: 2, // Espaçamento horizontal
              mainAxisSpacing: 2, // Espaçamento vertical
              childAspectRatio:
                  0.4, // Proporção da largura pela altura de cada item
            ),
            itemCount: listaDePessoas.length,
            itemBuilder: (BuildContext context, int index) {
              final pessoa = listaDePessoas[index];
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    final pessoa = listaDePessoas[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PessoasDetalhes(pessoa: pessoa),
                      ),
                    );
                    print(pessoa.nome);
                    print(pessoa.vivo);
                    print(
                      pessoa.ultimaOcorrencia!.dataLocalizacao ??
                          "Sem dada de Localização",
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 3),
                      ),
                      child: Column(
                        children: [
                          pessoa.urlFoto != null
                              ? Image.network(
                                  pessoa.urlFoto!,
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Este widget será exibido se a imagem falhar ao carregar (ex: erro 404)
                                    return const Icon(Icons.person, size: 200);
                                  },
                                )
                              : const Icon(
                                  Icons.person,
                                  size: 200,
                                  color: Colors.black,
                                ),
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
                                  // Verificação de nulo no nome
                                  pessoa.nome ?? 'Nome não informado',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  // Verificações de nulo para idade e sexo
                                  '${(pessoa.idade ?? 'idade não informada')} anos, ${(pessoa.sexo ?? 'sexo não informado')}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  // Verificação de nulo na data de desaparecimento
                                  'Data: ${pessoa.ultimaOcorrencia?.dtDesaparecimento?.substring(0, 10) ?? 'Não informada'}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  // Verificação de nulo no local de desaparecimento
                                  'Local: ${pessoa.ultimaOcorrencia?.localDesaparecimentoConcat ?? 'Não informado'}',
                                  style: const TextStyle(fontSize: 15),
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
