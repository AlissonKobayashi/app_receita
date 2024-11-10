import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_receita/models/receita.dart';
import 'package:app_receita/screens/list_screen.dart';

void main() {
  testWidgets('Testa a tela de Listagem de Receitas', (WidgetTester tester) async {

    final receitas = [
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

    await tester.pumpWidget(
      MaterialApp(
        home: ListaReceitas(
          receitas: receitas,
          onReceitaAdicionada: (receita) {},
        ),
      ),
    );

    expect(find.text('Bolo de Cenoura'), findsOneWidget);
    expect(find.text('Pizza Margherita'), findsOneWidget);

    expect(find.byIcon(Icons.favorite), findsNWidgets(1)); 

    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsNWidgets(1));

    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    expect(find.byIcon(Icons.favorite_border), findsNWidgets(1));
  });
}
