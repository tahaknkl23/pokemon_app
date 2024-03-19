import 'dart:convert';
import 'package:pokodex/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokeApi {
  static const String url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemon() async {
    List<PokemonModel> listem = [];
    var dioData = await Dio().get(url);
    if (dioData.statusCode == 200) {
      var jsonVeri = jsonDecode(dioData.data)['pokemon'];

      listem = (jsonVeri as List)
          .map(
            (e) => PokemonModel.fromJson(e),
          )
          .toList();
    } else {
      return [];
    }
    return listem;
  }
}
