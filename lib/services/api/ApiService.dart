
import 'package:chopper/chopper.dart';
part 'ApiService.chopper.dart';

@ChopperApi(baseUrl: "/pokemon")
abstract class PokemonApiService extends ChopperService{
    @Get()
    Future<Response> getPokemons(@Query('limit')int limit,@Query('offset') int offset);

    @Get(path:'/{id}')
  Future<Response> getPokemonDetail(@Path('id') String id);


  static create(){
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [
        // The generated implementation
        _$PokemonApiService(),
      ],
      // Converts data to &amp; from JSON and adds the application/json header.
      converter: JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$PokemonApiService(client);
  }
}