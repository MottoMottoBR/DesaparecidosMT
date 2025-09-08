import 'package:flutter/material.dart';
import 'package:myapp/models/pessoa_model.dart';
import '../estrutura/topo_policia_civil.dart';

int _calcularDias(String dateString) {
  try {
    final dataDoDesaparecimento = DateTime.parse(dateString);
    final agora = DateTime.now();
    final diferente = agora.difference(dataDoDesaparecimento);
    return diferente.inDays;
  } catch (e) {
    return 0;
  }
}

class PessoasDetalhes extends StatelessWidget {
  final PessoasModel pessoa;

  const PessoasDetalhes({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    final bool encontrada = pessoa.ultimaOcorrencia!.dataLocalizacao != null;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TopoPoliciaCivil(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: encontrada ? Colors.lightBlueAccent : Colors.red,
                    ),

                    child: pessoa.urlFoto != null
                        ? Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              pessoa.urlFoto!,
                              //height: 250,
                              // width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.person, size: 200);
                              },
                            ),
                          )
                        : Icon(Icons.person, size: 200, color: Colors.black),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Container(
                        width: 200,
                        height: 45,
                        decoration: BoxDecoration(
                          color: encontrada
                              ? Colors.lightBlueAccent
                              : Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            encontrada ? 'Localizada' : 'Desaparecido',

                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pessoa.nome ?? 'Nome não informado',
                              style: TextStyle(color: Colors.black),
                            ),

                            Text(
                              '${pessoa.idade ?? 'idade não informada'} anos, ${pessoa.sexo ?? 'sexo não informado'}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 1,
                              decoration: BoxDecoration(color: Colors.black),
                            ),

                            //Se a Pessoa esta Desaparecida esse bloco de informações e mostrada na tela
                            if (!encontrada)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Dados sobre o Desaparecimento",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "Data: ${pessoa.ultimaOcorrencia?.dtDesaparecimento != null ? '${pessoa.ultimaOcorrencia!.dtDesaparecimento!.substring(8, 10)}/${pessoa.ultimaOcorrencia!.dtDesaparecimento!.substring(5, 7)}/${pessoa.ultimaOcorrencia!.dtDesaparecimento!.substring(0, 4)}' : 'Não informada'}",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "Local: ${pessoa.ultimaOcorrencia?.localDesaparecimentoConcat ?? 'Não informado'}",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "Vestimenta: ${pessoa.ultimaOcorrencia?.ocorrenciaEntrevDesapDTO?.vestimentasDesaparecido ?? 'Não informado'}",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "Informações adicionais: ${pessoa.ultimaOcorrencia?.ocorrenciaEntrevDesapDTO?.informacao ?? 'Não informado'}",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "DESAPARECIDA HÁ ${pessoa.ultimaOcorrencia?.dtDesaparecimento != null ? _calcularDias(pessoa.ultimaOcorrencia!.dtDesaparecimento!) : 'Data não informada'} dias ",
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          'VIU OU SABE DESSA PESSOA?',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Ajude compartilhando:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        width: 250,
                                        height: 50,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "lib/imagens/whataspp.png",
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return const SizedBox(
                                                      width: 50,
                                                    );
                                                  },
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Compartilhe Pelo \n whatasapp",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "lib/imagens/insta.png",
                                              fit: BoxFit.contain,
                                              width: 46,
                                              height: 46,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Compartilhe Pelo Instagram",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
