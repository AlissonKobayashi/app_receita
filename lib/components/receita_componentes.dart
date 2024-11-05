import 'package:flutter/material.dart';

class ReceitaCard extends StatelessWidget {
  final String nome;
  final String descricao;

  ReceitaCard({
    required this.nome,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(nome),
        subtitle: Text(descricao),
      ),
    );
  }
}
