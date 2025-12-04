import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loja/core/enums/types_enum.dart';
import 'package:loja/shared/pokemon_type_selector_widget.dart';

class PokedexSearchView extends StatefulWidget {
  const PokedexSearchView({super.key});

  @override
  State<PokedexSearchView> createState() => _PokedexSearchViewState();
}

class _PokedexSearchViewState extends State<PokedexSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 211, 26, 26),
        title: Text("Pokemon Search", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15.h, horizontal: 15.w),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome do Pokémon',
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 211, 26, 26),
                    width: 2.sp,
                  ),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 211, 26, 26),
                    width: 2.sp,
                  ),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                suffixIcon: Icon(Icons.clear, color: Colors.black),
              ),
            ),
            SizedBox(height: 20.h),
            ExpandableTypeGrid(),
            SizedBox(height: 20.h),
            SizedBox(
              width: 250.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                ),
                onPressed: () {},
                child: Text(
                  'Pesquisar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableTypeGrid extends StatefulWidget {
  const ExpandableTypeGrid({super.key});

  @override
  State<ExpandableTypeGrid> createState() => _ExpandableTypeGridState();
}

class _ExpandableTypeGridState extends State<ExpandableTypeGrid> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Botão ou título clicável
        GestureDetector(
          onTap: _toggleExpanded,
          child: Row(
            children: [
              Text(
                'Selecionar Tipos',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        // Área que expande
        AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          crossFadeState: _isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.w,
            childAspectRatio: 3.5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: TypesEnum.values.map((type) {
              return PokemonTypeSelectorWidget(type: type);
            }).toList(),
          ),
          secondChild: SizedBox.shrink(),
        ),
      ],
    );
  }
}
