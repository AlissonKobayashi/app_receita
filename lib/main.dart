import 'package:flutter/material.dart';
import 'screens/screen.dart';
import 'screens/list_screen.dart';
import 'screens/forms_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Receitas',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/receitas': (context) => ReceitaListScreen(),
        '/adicionar-receita': (context) => ReceitaFormScreen(),
      },
    );
  }
}
