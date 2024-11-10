import 'package:app_receita/screens/list_screen.dart';
import 'package:app_receita/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:app_receita/screens/forms_screen.dart'; 

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaReceitas(
                    receitas: [], 
                    onReceitaAdicionada: (receita) {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioReceita(
                    onReceitaSalva: (receita) {
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
