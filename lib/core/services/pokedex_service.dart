import 'package:dartz/dartz.dart';
import 'package:loja/core/models/pokemon_base_model_response.dart';
import 'package:loja/core/models/pokemon_model_response.dart';
import 'package:loja/core/repository/pokedex_repository.dart';

class PokedexService {
  final PokedexRepository repository;

  PokedexService(this.repository);

  Future<Either<String, List<PokemonBaseModelResponse>>> getPokemonList({
    int offset = 0,
    int limit = 10,
  }) {
    return repository.fetchPokemonList(offset: offset, limit: limit);
  }

  Future<Either<String, List<PokemonModelResponse>>> getDetailedPokemonList(
    List<PokemonBaseModelResponse> baseList,
  ) async {
    try {
      final results = await Future.wait(
        baseList.map((pokemon) async {
          final result = await repository.fetchPokemonByUrl(url: pokemon.url);
          return result.fold<List<PokemonModelResponse>>(
            (_) => [],
            (data) => data,
          );
        }),
      );
      return Right(results.expand((e) => e).toList());
    } catch (e) {
      return Left('Erro ao buscar detalhes dos Pokémons: ${e.toString()}');
    }
  }
}
