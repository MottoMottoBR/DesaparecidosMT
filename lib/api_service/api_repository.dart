import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/estatisticas_model.dart';
import 'package:myapp/models/pessoa_model.dart';
import 'package:myapp/models/pessoas_filtro_model.dart';

class ApiRepositorio {
  // URL base para todos os endpoints da API
  final String _baseUrl =
      'https://abitus-api.geia.vip/v1/pessoas/aberto/dinamico?registros=150';

  Future<List<PessoasModel>> getPessoas() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => PessoasModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar Dados');
    }
  }
}
