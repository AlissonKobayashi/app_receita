import 'package:http/http.dart' as http;

class ReceitaService {
  final String baseUrl = 'http://localhost:3000';

  Future<http.Response> fetchReceitas() async {
    return await http.get(Uri.parse('$baseUrl/receitas'));
  }

  Future<http.Response> addReceita(Map<String, dynamic> receitaData) async {
    return await http.post(
      Uri.parse('$baseUrl/receitas'),
      body: receitaData,
    );
  }

  // Outros métodos de CRUD como update e delete
}
