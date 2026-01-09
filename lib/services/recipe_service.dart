import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class RecipeService {
  static const String baseUrl =
      "https://rpblbedyqmnzpowbumzd.supabase.co/rest/v1";

  static const String apiKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwYmxiZWR5cW1uenBvd2J1bXpkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgxMjcxMjYsImV4cCI6MjA3MzcwMzEyNn0.QaMJlyqhZcPorbFUpImZAynz3o2l0xDfq_exf2wUrTs";


  Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/recipes?select=*'),
        headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer $apiKey',
        },
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded is List) {
          return decoded.map((e) => Recipe.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> addRecipe(Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/recipes'),
        headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateRecipe(int id, Map<String, dynamic> body) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/recipes?id=eq.$id'),
        headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteRecipe(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/recipes?id=eq.$id'),
        headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer $apiKey',
        },
      );
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (e) {
      return false;
    }
  }
}
