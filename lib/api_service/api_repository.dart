import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/estatisticas_model.dart';
import 'package:myapp/models/pessoa_model.dart';

class ApiRepositorio {
  // URL base para buscar a lista de pessoas
  final String _basePessoasUrl =
      'https://abitus-api.geia.vip/v1/pessoas/aberto/dinamico?registros=50';

  // URL para o endpoint de estatísticas
  final String _baseEstatisticasUrl =
      'https://abitus-api.geia.vip/v1/pessoas/aberto/estatistico';

  /// Busca uma lista de pessoas desaparecidas.
  Future<List<PessoasModel>> getPessoas() async {
    final response = await http.get(Uri.parse(_basePessoasUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => PessoasModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar dados das pessoas');
    }
  }

  /// Busca estatísticas sobre pessoas desaparecidas e encontradas.
  Future<EstatisticasModel> getEstatisticas() async {
    final response = await http.get(Uri.parse(_baseEstatisticasUrl));

    if (response.statusCode == 200) {
      return EstatisticasModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao carregar dados estatísticos');
    }
  }
}