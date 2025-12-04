import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loja/core/enums/types_enum.dart';

class PokemonTypeWidget extends StatelessWidget {
  final TypesEnum type;

  const PokemonTypeWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(left: 6.w, right: 12.w, top: 4.h, bottom: 4.h),
        decoration: BoxDecoration(
          color: type.color,
          borderRadius: BorderRadius.circular(25.sp),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(type.assetPath, width: 24.w, height: 24.h),
            const SizedBox(width: 4),
            Text(
              type.nameString,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
