class EstatisticasModel {
  final int quantPessoasDesaparecidas;
  final int quantPessoasEncontradas;

  EstatisticasModel({
    required this.quantPessoasDesaparecidas,
    required this.quantPessoasEncontradas,
  });

  factory EstatisticasModel.fromJson(Map<String, dynamic> json) {
    return EstatisticasModel(
      quantPessoasDesaparecidas: json['quantPessoasDesaparecidas'] as int,
      quantPessoasEncontradas: json['quantPessoasEncontradas'] as int,
    );
  }
}