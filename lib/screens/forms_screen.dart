import 'package:flutter/material.dart';

class ReceitaFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Receita'),
      ),
      body: Center(
        child: Text('Formulário para adicionar uma nova receita'),
      ),
    );
  }
}
