// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_selection_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokedexSelectionViewModel on _PokedexSelectionViewModelBase, Store {
  late final _$gridTypeAtom = Atom(
    name: '_PokedexSelectionViewModelBase.gridType',
    context: context,
  );

  @override
  GridTypeEnum get gridType {
    _$gridTypeAtom.reportRead();
    return super.gridType;
  }

  @override
  set gridType(GridTypeEnum value) {
    _$gridTypeAtom.reportWrite(value, super.gridType, () {
      super.gridType = value;
    });
  }

  late final _$isSearchingAtom = Atom(
    name: '_PokedexSelectionViewModelBase.isSearching',
    context: context,
  );

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$fetchedInitialPokemonsAtom = Atom(
    name: '_PokedexSelectionViewModelBase.fetchedInitialPokemons',
    context: context,
  );

  @override
  bool get fetchedInitialPokemons {
    _$fetchedInitialPokemonsAtom.reportRead();
    return super.fetchedInitialPokemons;
  }

  @override
  set fetchedInitialPokemons(bool value) {
    _$fetchedInitialPokemonsAtom.reportWrite(
      value,
      super.fetchedInitialPokemons,
      () {
        super.fetchedInitialPokemons = value;
      },
    );
  }

  late final _$fetchingMorePokemonAtom = Atom(
    name: '_PokedexSelectionViewModelBase.fetchingMorePokemon',
    context: context,
  );

  @override
  bool get fetchingMorePokemon {
    _$fetchingMorePokemonAtom.reportRead();
    return super.fetchingMorePokemon;
  }

  @override
  set fetchingMorePokemon(bool value) {
    _$fetchingMorePokemonAtom.reportWrite(value, super.fetchingMorePokemon, () {
      super.fetchingMorePokemon = value;
    });
  }

  late final _$showTypesHintAtom = Atom(
    name: '_PokedexSelectionViewModelBase.showTypesHint',
    context: context,
  );

  @override
  bool get showTypesHint {
    _$showTypesHintAtom.reportRead();
    return super.showTypesHint;
  }

  @override
  set showTypesHint(bool value) {
    _$showTypesHintAtom.reportWrite(value, super.showTypesHint, () {
      super.showTypesHint = value;
    });
  }

  late final _$pokemonListAtom = Atom(
    name: '_PokedexSelectionViewModelBase.pokemonList',
    context: context,
  );

  @override
  ObservableList<PokemonModelResponse> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(ObservableList<PokemonModelResponse> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  late final _$favoritesMapAtom = Atom(
    name: '_PokedexSelectionViewModelBase.favoritesMap',
    context: context,
  );

  @override
  ObservableMap<int, bool> get favoritesMap {
    _$favoritesMapAtom.reportRead();
    return super.favoritesMap;
  }

  @override
  set favoritesMap(ObservableMap<int, bool> value) {
    _$favoritesMapAtom.reportWrite(value, super.favoritesMap, () {
      super.favoritesMap = value;
    });
  }

  late final _$pokedexOffsetAtom = Atom(
    name: '_PokedexSelectionViewModelBase.pokedexOffset',
    context: context,
  );

  @override
  int get pokedexOffset {
    _$pokedexOffsetAtom.reportRead();
    return super.pokedexOffset;
  }

  @override
  set pokedexOffset(int value) {
    _$pokedexOffsetAtom.reportWrite(value, super.pokedexOffset, () {
      super.pokedexOffset = value;
    });
  }

  late final _$setupAsyncAction = AsyncAction(
    '_PokedexSelectionViewModelBase.setup',
    context: context,
  );

  @override
  Future<void> setup() {
    return _$setupAsyncAction.run(() => super.setup());
  }

  late final _$disposeAsyncAction = AsyncAction(
    '_PokedexSelectionViewModelBase.dispose',
    context: context,
  );

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$getMorePokedexPokemonAsyncAction = AsyncAction(
    '_PokedexSelectionViewModelBase.getMorePokedexPokemon',
    context: context,
  );

  @override
  Future<void> getMorePokedexPokemon({int fetchLimit = 10}) {
    return _$getMorePokedexPokemonAsyncAction.run(
      () => super.getMorePokedexPokemon(fetchLimit: fetchLimit),
    );
  }

  late final _$fetchPokemonsAsyncAction = AsyncAction(
    '_PokedexSelectionViewModelBase.fetchPokemons',
    context: context,
  );

  @override
  Future<List<PokemonModelResponse>?> fetchPokemons({int fetchLimit = 10}) {
    return _$fetchPokemonsAsyncAction.run(
      () => super.fetchPokemons(fetchLimit: fetchLimit),
    );
  }

  late final _$_PokedexSelectionViewModelBaseActionController =
      ActionController(
        name: '_PokedexSelectionViewModelBase',
        context: context,
      );

  @override
  void toggleFavorite(int pokemonId) {
    final _$actionInfo = _$_PokedexSelectionViewModelBaseActionController
        .startAction(name: '_PokedexSelectionViewModelBase.toggleFavorite');
    try {
      return super.toggleFavorite(pokemonId);
    } finally {
      _$_PokedexSelectionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gridType: ${gridType},
isSearching: ${isSearching},
fetchedInitialPokemons: ${fetchedInitialPokemons},
fetchingMorePokemon: ${fetchingMorePokemon},
showTypesHint: ${showTypesHint},
pokemonList: ${pokemonList},
favoritesMap: ${favoritesMap},
pokedexOffset: ${pokedexOffset}
    ''';
  }
}
