class Receita {
  final int id;
  final String nome;
  final int categoriaId;
  bool favorito; 
  final List<String> ingredientes;

  Receita({
    required this.id,
    required this.nome,
    required this.categoriaId,
    required this.favorito,
    required this.ingredientes,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'categoriaId': categoriaId,
      'favorito': favorito,
      'ingredientes': ingredientes,
    };
  }

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
