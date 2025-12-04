import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loja/core/enums/types_enum.dart'; // Certifique-se do caminho

class FloatingQuickHelpWidget extends StatelessWidget {
  final bool showTypesHint;

  const FloatingQuickHelpWidget({required this.showTypesHint, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showTypesHint ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: Container(
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 280.w),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tipos de Pokémon',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: TypesEnum.values.map((type) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: type.color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        type.assetPath,
                        width: 20.w,
                        height: 20.w,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        type.nameString,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
