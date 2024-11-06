import 'package:flutter/material.dart';
import 'package:app_receita/receita.dart';

class ListaReceitas extends StatelessWidget {
  final List<Receita> receitas;

  ListaReceitas({required this.receitas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: receitas.length,
      itemBuilder: (context, index) {
        final receita = receitas[index];
        return ListTile(
          title: Text(receita.nome),
          subtitle: Text(receita.categoria),
        );
      },
    );
  }
}
