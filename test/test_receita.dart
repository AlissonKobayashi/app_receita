import 'package:flutter_test/flutter_test.dart';
import '../lib/models/receita.dart';

void main() {
  test('Deve criar uma instância de Receita', () {
    final receita = Receita(
      id: 1,
      nome: 'Bolo de Cenoura',
      descricao: 'Um bolo delicioso de cenoura',
      tempoPreparo: '45 minutos',
      nivelDificuldade: 'Fácil',
      categoriaId: 1,
      ingredientes: ['cenoura', 'farinha', 'açúcar', 'ovos'],
      instrucoes: ['Misture os ingredientes', 'Asse no forno'],
    );

    expect(receita.nome, 'Bolo de Cenoura');
    expect(receita.ingredientes.length, 4);
  });
}
