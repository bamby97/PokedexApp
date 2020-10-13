

import 'package:get_it/get_it.dart';
import 'package:pokedex/services/api/ApiService.dart';
import 'package:pokedex/viewmodels/DisplayPokemonsViewModel.dart';
import 'package:pokedex/viewmodels/PokemonDetailViewModel.dart';
GetIt serviceLocator = GetIt.instance;



  setUpServiceLocator(){
    serviceLocator.registerLazySingleton<PokemonApiService>(() => PokemonApiService.create());
    serviceLocator.registerFactory<DisplayPokemonsViewModel>(() => DisplayPokemonsViewModel());
    serviceLocator.registerFactory<PokemonDetailViewModel>(() => PokemonDetailViewModel());
  }
