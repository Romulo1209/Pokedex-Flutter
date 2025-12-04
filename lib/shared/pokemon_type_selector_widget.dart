import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loja/core/enums/types_enum.dart';

class PokemonTypeSelectorWidget extends StatelessWidget {
  final TypesEnum type;

  const PokemonTypeSelectorWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: type.color, width: 2.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(type.assetPath, width: 24.w, height: 24.h),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              type.nameString,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
