import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/pessoa_model.dart';

class ApiRepositorio {
  Future<List<PessoasModel>> getPessoas() async {
    try {
      final response = await http.get(
        Uri.parse('https://abitus-api.geia.vip/v1/pessoas/aberto/dinamico?registros=10'),
      );

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        final List<PessoasModel> listPessoas = [];

        for (var item in decodedJson) {
          listPessoas.add(PessoasModel.fromJson(item));
        }

        return listPessoas;
      } else {
        // Lança uma exceção se a resposta da API não for 200 OK
        throw Exception('Falha ao carregar a lista. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Lança uma exceção se ocorrer um erro de conexão ou outro problema
      throw Exception('Erro ao carregar a lista: $e');
    }
  }
}