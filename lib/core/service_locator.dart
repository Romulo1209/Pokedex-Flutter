import 'package:get_it/get_it.dart';
import 'package:loja/core/network/dio_client.dart';
import 'package:loja/core/repository/pokedex_repository.dart';
import 'package:loja/core/repository/pokedex_repository_impl.dart';
import 'package:loja/core/services/pokedex_service.dart';
import 'package:loja/home/modules/pokedex_selection/view_model/pokedex_selection_view_model.dart';

final getIt = GetIt.instance;

void setupLocator() {
  //Dio Client
  getIt.registerLazySingleton(() => DioClient());

  //Repository
  getIt.registerLazySingleton<PokedexRepository>(
    () => PokedexRepositoryImpl(getIt()),
  );

  //Service
  getIt.registerLazySingleton(() => PokedexService(getIt()));

  //View Model
  getIt.registerFactory<PokedexSelectionViewModel>(
    () => PokedexSelectionViewModel(getIt()),
  );
}
