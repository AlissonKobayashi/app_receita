import 'package:app_receita/models/receita.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://localhost:3000';

  Future<List<Receita>> fetchReceitas() async {
    final response = await http.get(Uri.parse('$baseUrl/receitas'));
    if (response.statusCode == 200) {
      final List<dynamic> receitasJson = json.decode(response.body);
      return receitasJson.map((json) => Receita.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar receitas');
    }
  }

  Future<void> adicionarReceita(Receita receita) async {
    final response = await http.post(
      Uri.parse('$baseUrl/receitas'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(receita.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Falha ao adicionar receita');
    }
  }
}
