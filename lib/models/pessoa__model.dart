class Pessoa {
  final int id;
  final String nome;
  final String foto;
  final String status;

  Pessoa({
    required this.id,
    required this.nome,
    required this.foto,
    required this.status,
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) {
    return Pessoa(
      id: json['id'],
      nome: json['nome'],
      foto: json['foto'],
      status: json['statis'],
    );
  }
}
