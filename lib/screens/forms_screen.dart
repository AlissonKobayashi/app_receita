import 'package:app_receita/models/receita.dart';
import 'package:flutter/material.dart';

class FormularioReceita extends StatefulWidget {
  final Function(Receita) onReceitaSalva;

  FormularioReceita({required this.onReceitaSalva});

  @override
  _FormularioReceitaState createState() => _FormularioReceitaState();
}

class _FormularioReceitaState extends State<FormularioReceita> {
  final _nomeController = TextEditingController();
  final _ingredientesController = TextEditingController();

  Future<void> adicionarReceita() async {
    final String nome = _nomeController.text;
    final String ingredientes = _ingredientesController.text;

    final novaReceita = Receita(
      id: DateTime.now().millisecondsSinceEpoch, 
      nome: nome,
      categoriaId: 1,
      favorito: false, 
      ingredientes: ingredientes.split(','), 
    );

    widget.onReceitaSalva(novaReceita);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Receita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome da Receita'),
            ),
            TextField(
              controller: _ingredientesController,
              decoration: InputDecoration(labelText: 'Ingredientes'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: adicionarReceita,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
