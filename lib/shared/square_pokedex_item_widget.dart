import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loja/core/enums/types_enum.dart';
import 'package:loja/shared/favorite_pokemon_widget.dart';

class SquarePokedexItemWidget extends StatelessWidget {
  final bool favorite;
  final int pokemonId;
  final String pokemonName;
  final String pokemonPhoto;
  final List<TypesEnum> pokemonTypes;
  final Function()? onPokemonTap;
  final Function()? onFavorite;

  const SquarePokedexItemWidget({
    this.favorite = false,
    required this.pokemonTypes,
    required this.pokemonId,
    required this.pokemonPhoto,
    required this.pokemonName,
    this.onPokemonTap,
    this.onFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: pokemonTypes[0].backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () => onPokemonTap?.call(),
          onDoubleTap: () => onFavorite?.call(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                right: -15.w,
                bottom: 0,
                child: Opacity(
                  opacity: 0.45,
                  child: SvgPicture.asset(
                    width: 70.w,
                    pokemonTypes[0].assetPath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned.fill(
                child: Image.network(pokemonPhoto, fit: BoxFit.contain),
              ),
              Positioned(
                bottom: 4.h,
                child: Text(
                  pokemonName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Text(
                  "#${pokemonId.toString().padLeft(3, '0')}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: FavoritePokemonWidget(
                  size: 24,
                  favorite: favorite,
                  onFavorite: onFavorite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
