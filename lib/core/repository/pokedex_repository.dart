import 'package:dartz/dartz.dart';
import 'package:loja/core/models/pokemon_base_model_response.dart';
import 'package:loja/core/models/pokemon_model_response.dart';

abstract class PokedexRepository {
  Future<Either<String, List<PokemonBaseModelResponse>>> fetchPokemonList({
    int offset = 0,
    int limit = 10,
  });

  Future<Either<String, List<PokemonModelResponse>>> fetchPokemonByUrl({
    required String url,
  });
}
