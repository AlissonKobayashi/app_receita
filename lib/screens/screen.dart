import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard de Receitas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao App de Receitas!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/receitas');
              },
              child: Text('Ver Receitas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/adicionar-receita');
              },
              child: Text('Adicionar Receita'),
            ),
          ],
        ),
      ),
    );
  }
}
