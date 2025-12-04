import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loja/core/service_locator.dart';
import 'package:loja/home/modules/pokedex_selection/view_model/pokedex_selection_view_model.dart';
import 'package:loja/shared/floating_quick_help_widget.dart';
import 'package:loja/shared/pokedex_list_view_widget.dart';

class PokedexSelectionView extends StatefulWidget {
  const PokedexSelectionView({super.key});

  @override
  State<PokedexSelectionView> createState() => _PokedexSelectionViewState();
}

class _PokedexSelectionViewState extends State<PokedexSelectionView> {
  late final PokedexSelectionViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.setup();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 211, 26, 26),
        title: Text("Pokedex", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/search'),
            icon: Icon(Icons.search, color: Colors.white),
          ),
          Observer(
            builder: (context) {
              return IconButton(
                onPressed: () => viewModel.gridType = viewModel.gridType.next,
                icon: Icon(
                  viewModel.gridType.gridTypeIcon,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: PokedexListViewWidget(viewModel: viewModel),
            ),
          ),
          if (viewModel.showTypesHint)
            Observer(
              builder: (context) {
                if (viewModel.showTypesHint) {
                  return Positioned(
                    bottom: 60.h,
                    right: 12.w,
                    child: FloatingQuickHelpWidget(
                      showTypesHint: viewModel.showTypesHint,
                    ),
                  );
                }

                return Container();
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 211, 26, 26),
        onPressed: () => viewModel.showTypesHint = !viewModel.showTypesHint,
        child: Icon(Icons.help_outline, color: Colors.white, size: 24.sp),
      ),
    );
  }
}
