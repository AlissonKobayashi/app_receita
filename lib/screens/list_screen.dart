import 'package:app_receita/Storage/receita_storage.dart';
import 'package:flutter/material.dart';
import 'package:app_receita/models/receita.dart';
import 'package:app_receita/screens/forms_screen.dart'; 

class ListaReceitas extends StatefulWidget {
  final List<Receita> receitas;
  final Function(Receita) onReceitaAdicionada; 

  ListaReceitas({required this.receitas, required this.onReceitaAdicionada});

  @override
  _ListaReceitasState createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  late List<Receita> receitas;

  @override
  void initState() {
    super.initState();
    receitas = widget.receitas;
  }

  void atualizarFavorito(Receita receita) {
    setState(() {
      receita.favorito = !receita.favorito;
    });
    ReceitaStorage.salvarReceitas(receitas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Receitas"),
      ),
      body: ListView.builder(
        itemCount: receitas.length,
        itemBuilder: (context, index) {
          final receita = receitas[index];
          return ListTile(
            title: Text(receita.nome),
            subtitle: Text("Ingredientes: ${receita.ingredientes.join(', ')}"),
            trailing: IconButton(
              icon: Icon(
                receita.favorito ? Icons.favorite : Icons.favorite_border,
                color: receita.favorito ? Colors.red : null,
              ),
              onPressed: () => atualizarFavorito(receita),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Receita? novaReceita = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioReceita(onReceitaSalva: widget.onReceitaAdicionada),
            ),
          );
          if (novaReceita != null) {
            widget.onReceitaAdicionada(novaReceita);
            ReceitaStorage.salvarReceitas(receitas);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
