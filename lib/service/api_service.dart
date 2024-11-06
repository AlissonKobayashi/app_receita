import 'dart:convert';
import 'package:app_receita/receita.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Receita>> buscarReceitas() async {
    final response =
        await http.get(Uri.parse('https://api.exemplo.com/receitas'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Receita.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar receitas');
    }
  }

  fetchReceitas() {}
}
