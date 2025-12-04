import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loja/core/enums/types_enum.dart';
import 'package:loja/shared/favorite_pokemon_widget.dart';
import 'package:loja/shared/pokemon_type_widget.dart';

class HorizontalPokedexItemWidget extends StatelessWidget {
  final bool favorite;
  final int pokemonId;
  final String pokemonName;
  final String pokemonPhoto;
  final List<TypesEnum> pokemonTypes;
  final Function()? onPokemonTap;
  final Function()? onFavorite;

  const HorizontalPokedexItemWidget({
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
    return GestureDetector(
      onTap: () => onPokemonTap?.call(),
      onDoubleTap: () => onFavorite?.call(),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: pokemonTypes[0].backgroundColor,
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -60.h,
              right: -60.w,
              child: Opacity(
                opacity: 0.45,
                child: SvgPicture.asset(
                  pokemonTypes[0].assetPath,
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, top: 8.h, bottom: 8.h),
                    child: SizedBox(
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "#${pokemonId.toString().padLeft(3, '0')}",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            pokemonName.replaceFirst(
                              pokemonName[0],
                              pokemonName[0].toUpperCase(),
                            ),
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          SizedBox(
                            width: double.infinity,
                            height: 30.h,
                            child: Row(
                              children: pokemonTypes
                                  .map(
                                    (type) => Padding(
                                      padding: EdgeInsets.only(right: 4.w),
                                      child: PokemonTypeWidget(type: type),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: double.infinity,
                    child: Image.network(pokemonPhoto, fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: FavoritePokemonWidget(
                size: 28,
                favorite: favorite,
                onFavorite: onFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
