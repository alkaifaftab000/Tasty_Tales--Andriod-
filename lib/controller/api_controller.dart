import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tasty_reciepes/model/api_model.dart';

class ApiController {
  List<Recipe> recipeList = [];

  Future<List<Recipe>> getRecipes(String query) async {
    const String appId = '3faf07fb';
    const String apiKey = '6e5ef32a663335cb55f4d29e9f30417b';
    final String url =
        'https://api.edamam.com/search?q=$query&app_id=$appId&app_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        recipeList = (data['hits'] as List)
            .map((element) => Recipe.fromMap(element['recipe']))
            .toList();

        return recipeList;
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      debugPrint('Error fetching recipes: $e');
      return [];
    }
  }

  void clearRecipeList() {
    recipeList.clear();
  }
}
