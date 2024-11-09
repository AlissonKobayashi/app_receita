import 'package:app_receita/Storage/receita_storage.dart';
import 'package:flutter/material.dart';
import 'package:app_receita/models/receita.dart';
import 'package:app_receita/screens/list_screen.dart'; // Tela de listagem

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Receita> receitas = [];

  @override
  void initState() {
    super.initState();
    _carregarReceitas();  // Carregar as receitas ao iniciar
  }

  // Carregar receitas
  _carregarReceitas() async {
    List<Receita> loadedReceitas = await ReceitaStorage.carregarReceitas();
    setState(() {
      receitas = loadedReceitas;
    });
  }

  // Função para adicionar uma nova receita
  void adicionarReceita(Receita receita) {
    setState(() {
      receitas.add(receita);  // Adiciona a nova receita
    });
    // Salva as receitas depois de adicionar
    ReceitaStorage.salvarReceitas(receitas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
      ),
      body: ListaReceitas(
        receitas: receitas,  // Passa a lista de receitas
        onReceitaAdicionada: adicionarReceita,  // Passa a função para adicionar receitas
      ),
    );
  }
}
