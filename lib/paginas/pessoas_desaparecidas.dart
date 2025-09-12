import 'package:flutter/material.dart';
import 'package:myapp/paginas/pessoas_detalhes_desaparecida.dart';
import '../api_service/api_repository.dart';
import '../models/pessoa_model.dart';

class PessoasDesaparecidas extends StatefulWidget {
  const PessoasDesaparecidas({super.key});

  @override
  State<PessoasDesaparecidas> createState() => _PessoasDesaparecidasState();
}

class _PessoasDesaparecidasState extends State<PessoasDesaparecidas> {
  final ApiRepositorio _apiRepositorio = ApiRepositorio();
  final ScrollController _scrollController = ScrollController();

  List<PessoasModel> _pessoas = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    _fetchPessoas();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchPessoas() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      final newPessoas = await _apiRepositorio.getPessoas(page: _currentPage, registros: 10);
      if (newPessoas.isEmpty) {
        setState(() {
          _hasMoreData = false;
        });
      } else {
        setState(() {
          _pessoas.addAll(newPessoas);
          _currentPage++;
        });
      }
    } catch (e) {
      print('Erro ao carregar dados: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading && _hasMoreData) {
      _fetchPessoas();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pessoas.isEmpty && _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _pessoas.isEmpty && !_isLoading
          ? const Center(child: Text('Nenhuma pessoa desaparecida encontrada.'))
          : GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.4,
        ),
        itemCount: _pessoas.length + (_hasMoreData ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index < _pessoas.length) {
            final pessoa = _pessoas[index];
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
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
                            return const Icon(Icons.person, size: 200);
                          },
                        )
                            : const Icon(
                          Icons.person,
                          size: 200,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Padding(
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
                                  pessoa.nome ?? 'Nome não informado',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${(pessoa.idade ?? 'idade não informada')} anos, ${(pessoa.sexo ?? 'sexo não informado')}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Data: ${pessoa.ultimaOcorrencia?.dtDesaparecimento?.substring(0, 10) ?? 'Não informada'}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Local: ${pessoa.ultimaOcorrencia?.localDesaparecimentoConcat ?? 'Não informado'}',
                                  style: const TextStyle(fontSize: 15),
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
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}