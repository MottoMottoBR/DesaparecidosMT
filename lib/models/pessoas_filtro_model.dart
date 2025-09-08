import 'package:myapp/models/pessoa_model.dart';

class PessoasFiltroModel {
  final List<PessoasModel> content;
  final int totalPages;
  final int totalElements;

  PessoasFiltroModel({
    required this.content,
    required this.totalPages,
    required this.totalElements,
  });

  factory PessoasFiltroModel.fromJson(Map<String, dynamic> json) {
    return PessoasFiltroModel(
      content: (json['content'] as List)
          .map((item) => PessoasModel.fromJson(item))
          .toList(),
      totalPages: json['totalPages'] as int,
      totalElements: json['totalElements'] as int,
    );
  }
}