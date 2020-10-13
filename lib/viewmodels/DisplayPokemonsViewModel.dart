import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pokedex/services/api/ApiService.dart';
import 'package:pokedex/services/ServiceLocator.dart';
import 'package:pokedex/models/Pokemon.dart';

class DisplayPokemonsViewModel extends ChangeNotifier{
  final PokemonApiService _pokemonApiService = serviceLocator<PokemonApiService>();
  static const LIMIT=40;
  int offset=0;
  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons =>_pokemons;
  void loadPokemons() async{
    _pokemonApiService.getPokemons(LIMIT, offset).then((value) {
      Map<String, dynamic> json=value.body;
      if(json["results"]!=null) {
        json["results"].forEach((pokemon) =>
            _pokemons.add(Pokemon.fromJson(pokemon)));
        offset+=LIMIT;
        notifyListeners();
      }
    });
  }
}