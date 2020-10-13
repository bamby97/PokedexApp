import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:pokedex/models/PokemonDetail.dart';
import 'package:pokedex/services/api/ApiService.dart';
import 'package:pokedex/services/ServiceLocator.dart';

class PokemonDetailViewModel extends ChangeNotifier{
  final PokemonApiService _pokemonApiService = serviceLocator<PokemonApiService>();

  PokemonDetail _pokemonDetail=PokemonDetail();

  PokemonDetail get pokemonDetail => _pokemonDetail;

  void loadPokemonDetail(String id) async{
    _pokemonApiService.getPokemonDetail(id).then((value) {
      //log(value.body.toString());
      _pokemonDetail=PokemonDetail.fromJson(value.body);
      notifyListeners();
    });

  }
}