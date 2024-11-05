import 'package:flutter/material.dart';

class ReceitaListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Receitas'),
      ),
      body: Center(
        child: Text('Aqui será exibida a lista de receitas'),
      ),
    );
  }
}
