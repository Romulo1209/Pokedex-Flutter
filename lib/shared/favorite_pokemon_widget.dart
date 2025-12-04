import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePokemonWidget extends StatefulWidget {
  final int size;
  final bool favorite;
  final Function()? onFavorite;

  const FavoritePokemonWidget({
    required this.size,
    this.favorite = false,
    this.onFavorite,
    super.key,
  });

  @override
  State<FavoritePokemonWidget> createState() => _FavoritePokemonWidgetState();
}

class _FavoritePokemonWidgetState extends State<FavoritePokemonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onFavorite,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Icon(
          widget.favorite ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(
            widget.favorite,
          ), // <- essencial para detecção de mudança
          size: widget.size.sp,
          color: widget.favorite ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}
