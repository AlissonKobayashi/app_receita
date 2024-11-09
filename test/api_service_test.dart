import 'package:app_receita/service/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Importe o modelo Receita

// Criação de um MockClient para simular a resposta HTTP
class MockClient extends Mock implements http.Client {}

void main() {
  group('Teste de API', () {
    test('Deve buscar receitas com sucesso', () async {
      final mockClient = MockClient();
      final apiService = ApiService();

      when(mockClient.get(Uri.parse('http://localhost:3000/receitas')))
          .thenAnswer((_) async => http.Response(
                jsonEncode([
                  {'nome': 'Bolo de Chocolate', 'categoria': 'Sobremesa'},
                  {'nome': 'Arroz com Feijão', 'categoria': 'Prato Principal'},
                ]),
                200,
              ));

      final response = await apiService.fetchReceitas();

      expect(response.statusCode, 200);
      final receitas = jsonDecode(response.body) as List;
      expect(receitas.length, 2);
      expect(receitas[0]['nome'], 'Bolo de Chocolate');
      expect(receitas[1]['nome'], 'Arroz com Feijão');
    });

    test('Deve lançar exceção em caso de erro na requisição', () async {
      final mockClient = MockClient();
      final apiService = ApiService();

      when(mockClient.get(Uri.parse('http://localhost:3000/receitas')))
          .thenAnswer((_) async => http.Response('Erro', 500));

      expect(() async => await apiService.fetchReceitas(), throwsException);
    });
  });
}
