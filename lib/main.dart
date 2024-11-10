import 'package:flutter/material.dart';
import 'package:app_receita/models/receita.dart';
import 'package:app_receita/screens/forms_screen.dart';
import 'package:app_receita/screens/list_screen.dart';
import 'package:app_receita/screens/screen.dart';

void main() {
  runApp(ReceitasApp());
}

class ReceitasApp extends StatefulWidget {
  @override
  _ReceitasAppState createState() => _ReceitasAppState();
}

class _ReceitasAppState extends State<ReceitasApp> {
  List<Receita> receitas = [
    Receita(
      id: 1,
      nome: "Bolo de Cenoura",
      ingredientes: ["cenoura", "farinha", "açúcar"],
      categoriaId: 1,
      favorito: false,
    ),
    Receita(
      id: 2,
      nome: "Pizza Margherita",
      ingredientes: ["farinha", "molho de tomate", "queijo"],
      categoriaId: 2,
      favorito: true,
    ),
  ];

  void adicionarReceita(Receita receita) {
    setState(() {
      receitas.add(receita); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Receitas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/listaReceitas': (context) => ListaReceitas(
          receitas: receitas,
          onReceitaAdicionada: adicionarReceita, 
        ),
        '/formularioReceita': (context) => FormularioReceita(
          onReceitaSalva: adicionarReceita,
        ),
      },
    );
  }
}
