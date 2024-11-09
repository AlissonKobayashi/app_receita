import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_receita/models/receita.dart';

class ReceitaStorage {
  static const String _keyReceitas = "receitas";

  // Salvar receitas
  static Future<void> salvarReceitas(List<Receita> receitas) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> receitasJson = receitas.map((receita) => jsonEncode(receita.toJson())).toList();
    await prefs.setStringList(_keyReceitas, receitasJson);
  }

  // Carregar receitas
  static Future<List<Receita>> carregarReceitas() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? receitasJson = prefs.getStringList(_keyReceitas);
    if (receitasJson != null) {
      return receitasJson.map((e) => Receita.fromJson(jsonDecode(e))).toList();
    }
    return [];
  }
}
