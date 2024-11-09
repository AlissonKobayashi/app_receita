class Receita {
  final int id;
  final String nome;
  final int categoriaId;
  bool favorito; // Tornando 'favorito' mutável
  final List<String> ingredientes;

  Receita({
    required this.id,
    required this.nome,
    required this.categoriaId,
    required this.favorito,
    required this.ingredientes,
  });

  // Método para converter a receita para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'categoriaId': categoriaId,
      'favorito': favorito,
      'ingredientes': ingredientes,
    };
  }

  // Método para criar uma receita a partir de um JSON
  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['id'],
      nome: json['nome'],
      categoriaId: json['categoriaId'],
      favorito: json['favorito'],
      ingredientes: List<String>.from(json['ingredientes']),
    );
  }
}
