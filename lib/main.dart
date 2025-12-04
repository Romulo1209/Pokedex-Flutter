import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:loja/core/service_locator.dart';
import 'package:loja/home/modules/pokedex_search/view/pokedex_search_view.dart';

import 'package:loja/home/modules/pokedex_selection/view/pokedex_selection_view.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const LojaApp()));
}

class LojaApp extends StatelessWidget {
  const LojaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Loja App',
          debugShowCheckedModeBanner: false,
          initialRoute: '/pokedex',
          getPages: [
            GetPage(name: '/pokedex', page: () => const PokedexSelectionView()),
            GetPage(name: '/search', page: () => const PokedexSearchView()),
          ],
        );
      },
    );
  }
}
