import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/estatisticas_model.dart';
import 'package:myapp/models/pessoa_model.dart';
import 'package:myapp/models/pessoas_filtro_model.dart';

class ApiRepositorio {
  // URL base para todos os endpoints da API
  final String _baseUrl = 'https://abitus-api.geia.vip/v1/pessoas/aberto';


  Future<List<PessoasModel>> getPessoas() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/dinamico?registros=10'),
      );

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        final List<PessoasModel> listPessoas = [];

        for (var item in decodedJson) {
          listPessoas.add(PessoasModel.fromJson(item));
        }

        return listPessoas;
      } else {
        throw Exception('Falha ao carregar a lista. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao carregar a lista: $e');
    }
  }


  Future<EstatisticasModel> getEstatisticas() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/estatistico'),
      );

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return EstatisticasModel.fromJson(decodedJson);
      } else {
        throw Exception('Falha ao carregar as estatísticas. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao carregar as estatísticas: $e');
    }
  }


  Future<PessoasFiltroModel> getPessoasFiltradas({
    String? nome,
    int? faixaIdadeInicial,
    int? faixaIdadeFinal,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {
        'nome': nome,
        'faixaIdadeInicial': faixaIdadeInicial?.toString(),
        'faixaIdadeFinal': faixaIdadeFinal?.toString(),
      };

      final uri = Uri.parse('$_baseUrl/filtro').replace(queryParameters: queryParams);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return PessoasFiltroModel.fromJson(decodedJson);
      } else {
        throw Exception('Falha ao filtrar pessoas. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao filtrar pessoas: $e');
    }
  }
}