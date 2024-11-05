class Receita {
  final int id;
  final String nome;
  final String descricao;
  final String tempoPreparo;
  final String nivelDificuldade;
  final int categoriaId;
  final List<String> ingredientes;
  final List<String> instrucoes;

  Receita({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.tempoPreparo,
    required this.nivelDificuldade,
    required this.categoriaId,
    required this.ingredientes,
    required this.instrucoes,
  });
}
