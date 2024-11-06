import 'package:app_receita/receita.dart';
import 'package:app_receita/service/receita_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Teste de Lógica de Filtro', () {
    test('Deve filtrar receitas por nome', () {
      final receitaService = ReceitaService();
      final receitas = [
        Receita(nome: 'Bolo de Chocolate', categoria: 'Sobremesa'),
        Receita(nome: 'Bolo de Morango', categoria: 'Sobremesa'),
        Receita(nome: 'Arroz com Feijão', categoria: 'Prato Principal'),
      ];

      final resultado = receitaService.filtrarReceitasPorNome(receitas, 'Bolo');

      expect(resultado.length, 2);
      expect(resultado[0].nome, 'Bolo de Chocolate');
      expect(resultado[1].nome, 'Bolo de Morango');
    });

    test('Deve retornar uma lista vazia quando não encontrar receitas', () {
      // Setup: Cria o serviço e a lista de receitas
      final receitaService = ReceitaService();
      final receitas = [
        Receita(nome: 'Bolo de Chocolate', categoria: 'Sobremesa'),
      ];

      // Ação: Aplica o filtro
      final resultado =
          receitaService.filtrarReceitasPorNome(receitas, 'Pizza');

      // Verificação: Verifica se a lista está vazia
      expect(resultado.isEmpty, true);
    });
  });
}
