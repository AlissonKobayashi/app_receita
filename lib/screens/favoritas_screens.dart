import 'package:flutter/material.dart';
import 'package:app_receita/models/receita.dart';

class ListaReceitasFavoritas extends StatelessWidget {
  final List<Receita> receitasFavoritas;

  ListaReceitasFavoritas({required this.receitasFavoritas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receitas Favoritas"),
      ),
      body: ListView.builder(
        itemCount: receitasFavoritas.length,
        itemBuilder: (context, index) {
          final receita = receitasFavoritas[index];
          return ListTile(
            title: Text(receita.nome),
            subtitle: Text("Ingredientes: ${receita.ingredientes.join(', ')}"),
          );
        },
      ),
    );
  }
}
