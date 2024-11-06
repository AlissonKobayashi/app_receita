import 'package:app_receita/receita.dart';
import 'package:app_receita/widget/receita_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deve exibir a lista de receitas', (WidgetTester tester) async {
    final receitas = [
      Receita(nome: 'Bolo de Chocolate', categoria: 'Sobremesa'),
      Receita(nome: 'Arroz com Feijão', categoria: 'Prato Principal'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListaReceitas(receitas: receitas),
        ),
      ),
    );

    expect(find.text('Bolo de Chocolate'), findsOneWidget);
    expect(find.text('Arroz com Feijão'), findsOneWidget);
    expect(find.text('Sobremesa'), findsOneWidget);
    expect(find.text('Prato Principal'), findsOneWidget);
  });
}
