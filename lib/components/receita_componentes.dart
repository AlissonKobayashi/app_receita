import 'package:app_receita/screens/list_screen.dart';
import 'package:app_receita/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:app_receita/screens/forms_screen.dart';  // Importe a tela de formulário de receita

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Receitas App', style: TextStyle(color: Colors.white, fontSize: 24)),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Lista de Receitas'),
            onTap: () {
              // Passando a lista de receitas e a função de adicionar
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaReceitas(
                    receitas: [],  // Aqui você pode passar a lista de receitas persistidas
                    onReceitaAdicionada: (receita) {
                      // Função para adicionar receita na lista
                      print("Receita adicionada: ${receita.nome}");
                    },
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Adicionar Receita'),
            onTap: () {
              // Passando a função de salvar a receita
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioReceita(
                    onReceitaSalva: (receita) {
                      // Lógica para salvar a receita
                      print("Receita salva: ${receita.nome}");
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
