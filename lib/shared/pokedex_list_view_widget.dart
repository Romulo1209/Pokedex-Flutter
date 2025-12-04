import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja/core/enums/grid_type_enum.dart';
import 'package:loja/shared/horizontal_pokedex_item_widget.dart';
import 'package:loja/shared/square_pokedex_item_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:loja/home/modules/pokedex_selection/view_model/pokedex_selection_view_model.dart';

class PokedexListViewWidget extends StatefulWidget {
  final PokedexSelectionViewModel viewModel;

  const PokedexListViewWidget({required this.viewModel, super.key});

  @override
  State<PokedexListViewWidget> createState() => _PokedexListViewWidgetState();
}

class _PokedexListViewWidgetState extends State<PokedexListViewWidget> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 400) {
      widget.viewModel.getMorePokedexPokemon();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (!widget.viewModel.fetchedInitialPokemons) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: 10,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, __) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        }

        final isVertical =
            widget.viewModel.gridType == GridTypeEnum.verticalList;

        if (isVertical) {
          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: widget.viewModel.pokemonList.length,
            itemBuilder: (context, index) {
              return _PokemonItemObserver(
                viewModel: widget.viewModel,
                index: index,
              );
            },
          );
        } else {
          return GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: widget.viewModel.pokemonList.length,
            itemBuilder: (context, index) {
              return _PokemonItemObserver(
                viewModel: widget.viewModel,
                index: index,
              );
            },
          );
        }
      },
    );
  }
}

class _PokemonItemObserver extends StatelessWidget {
  final PokedexSelectionViewModel viewModel;
  final int index;

  const _PokemonItemObserver({required this.viewModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final pokemon = viewModel.pokemonList[index];
        switch (viewModel.gridType) {
          case GridTypeEnum.verticalList:
            return Column(
              children: [
                HorizontalPokedexItemWidget(
                  favorite: viewModel.isFavorite(pokemon.id),
                  pokemonId: pokemon.id,
                  pokemonName: pokemon.name,
                  pokemonPhoto: pokemon.imageUrl,
                  pokemonTypes: pokemon.typeEnums,
                  onFavorite: () => viewModel.toggleFavorite(pokemon.id),
                ),
                const SizedBox(height: 10),
              ],
            );
          case GridTypeEnum.squareList:
            return Column(
              children: [
                SquarePokedexItemWidget(
                  favorite: viewModel.isFavorite(pokemon.id),
                  pokemonId: pokemon.id,
                  pokemonName: pokemon.name,
                  pokemonPhoto: pokemon.pixelIconUrl,
                  pokemonTypes: pokemon.typeEnums,
                  onFavorite: () => viewModel.toggleFavorite(pokemon.id),
                ),
                const SizedBox(height: 10),
              ],
            );
        }
      },
    );
  }
}
