// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PokemonApiService extends PokemonApiService {
  _$PokemonApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PokemonApiService;

  Future<Response> getPokemons(int limit, int offset) {
    final $url = '/pokemon';
    final Map<String, dynamic> $params = {'limit': limit, 'offset': offset};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getPokemonDetail(String id) {
    final $url = '/pokemon/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
