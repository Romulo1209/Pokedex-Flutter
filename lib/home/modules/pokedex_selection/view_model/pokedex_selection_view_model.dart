import 'package:loja/core/enums/grid_type_enum.dart';
import 'package:loja/core/models/pokemon_model_response.dart';
import 'package:loja/core/services/pokedex_service.dart';
import 'package:mobx/mobx.dart';

part 'pokedex_selection_view_model.g.dart';

class PokedexSelectionViewModel = _PokedexSelectionViewModelBase
    with _$PokedexSelectionViewModel;

abstract class _PokedexSelectionViewModelBase with Store {
  final PokedexService pokedexService;

  _PokedexSelectionViewModelBase(this.pokedexService);

  @observable
  GridTypeEnum gridType = GridTypeEnum.verticalList;

  @observable
  bool isSearching = false;

  @observable
  bool fetchedInitialPokemons = false;

  @observable
  bool fetchingMorePokemon = false;

  @observable
  bool showTypesHint = false;

  @observable
  ObservableList<PokemonModelResponse> pokemonList = ObservableList();

  @observable
  ObservableMap<int, bool> favoritesMap = ObservableMap<int, bool>();

  @observable
  int pokedexOffset = 0;

  bool isFavorite(int pokemonId) => favoritesMap[pokemonId] ?? false;

  @action
  Future<void> setup() async {
    await getMorePokedexPokemon(
      fetchLimit: 20,
    ).then((_) => fetchedInitialPokemons = true);
  }

  @action
  Future<void> dispose() async {}

  @action
  Future<void> getMorePokedexPokemon({int fetchLimit = 10}) async {
    if (fetchingMorePokemon) return;

    fetchingMorePokemon = true;

    List<PokemonModelResponse>? response = await fetchPokemons(
      fetchLimit: fetchLimit,
    );

    if (response != null) {
      pokedexOffset += response.length;
      pokemonList.addAll(response);
    }
    fetchingMorePokemon = false;
  }

  @action
  Future<List<PokemonModelResponse>?> fetchPokemons({
    int fetchLimit = 10,
  }) async {
    try {
      final baseResult = await pokedexService.getPokemonList(
        offset: pokedexOffset,
        limit: fetchLimit,
      );

      return await baseResult.fold((_) async => null, (baseList) async {
        final detailResult = await pokedexService.getDetailedPokemonList(
          baseList,
        );

        return detailResult.fold((_) => null, (detailedList) => detailedList);
      });
    } catch (e) {
      print("Error $e");
      return null;
    }
  }

  @action
  void toggleFavorite(int pokemonId) {
    favoritesMap[pokemonId] = !(favoritesMap[pokemonId] ?? false);
  }
}
