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
  // Lista de receitas que será passada para as telas
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

  // Função para adicionar uma nova receita na lista
  void adicionarReceita(Receita receita) {
    setState(() {
      receitas.add(receita);  // Adiciona a nova receita
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Aplicativo de Receitas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
=======
      title: 'App de Receitas',
      theme: ThemeData(primarySwatch: Colors.blue),
>>>>>>> c403c7381fc74bf0efc981079586c4ac15f8cba9
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/listaReceitas': (context) => ListaReceitas(
          receitas: receitas,
          onReceitaAdicionada: adicionarReceita,  // Passa a função para adicionar receitas
        ),
        '/formularioReceita': (context) => FormularioReceita(
          onReceitaSalva: adicionarReceita,  // Passa a função para salvar a receita
        ),
      },
    );
  }
}
