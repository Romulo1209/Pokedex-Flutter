import 'package:dartz/dartz.dart';
import 'package:loja/core/models/pokemon_base_model_response.dart';
import 'package:loja/core/models/pokemon_model_response.dart';
import 'package:loja/core/network/dio_client.dart';
import 'package:loja/core/repository/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final DioClient dio;

  PokedexRepositoryImpl(this.dio);

  @override
  Future<Either<String, List<PokemonBaseModelResponse>>> fetchPokemonList({
    int offset = 0,
    int limit = 10,
  }) async {
    try {
      final response = await dio.get(
        'pokemon',
        queryParameters: {'offset': offset, 'limit': limit},
      );

      final List results = response.data['results'];
      final pokemons = results
          .map((e) => PokemonBaseModelResponse.fromJson(e))
          .toList();
      return Right(pokemons);
    } catch (e) {
      return Left('Failed to fetch Pokémon list: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<PokemonModelResponse>>> fetchPokemonByUrl({
    required String url,
  }) async {
    try {
      final uri = Uri.parse(url);
      final relativePath = uri.path.replaceFirst('/api/v2/', '');

      final response = await dio.get(relativePath);
      final pokemon = PokemonModelResponse.fromJson(response.data);

      return Right([pokemon]);
    } catch (e) {
      return Left('Erro ao buscar Pokémon: ${e.toString()}');
    }
  }
}
