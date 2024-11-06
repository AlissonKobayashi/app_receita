class Receita {
  final String nome;
  final String categoria;

  Receita({required this.nome, required this.categoria});

  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      nome: json['nome'],
      categoria: json['categoria'],
    );
  }
}
