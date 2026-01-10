import 'package:dio/dio.dart';
import 'package:flutter_block_pruebas/core/network/interceptors/error_interceptor.dart';
import 'package:flutter_block_pruebas/features/data/datasources/pokemon_local_datasource_impl.dart';
import 'package:flutter_block_pruebas/features/data/datasources/pokemon_remote_datasource_impl.dart';
import 'package:flutter_block_pruebas/features/data/repositories/repository_pokemon_impl.dart';
import 'package:flutter_block_pruebas/features/domain/datasources/pokemon_local_datasource.dart';
import 'package:flutter_block_pruebas/features/domain/datasources/pokemon_remote_datasource.dart';
import 'package:flutter_block_pruebas/features/domain/repositories/repository_pokemon.dart';
import 'package:flutter_block_pruebas/features/domain/usecases/capture_pokemon.dart';
import 'package:flutter_block_pruebas/features/domain/usecases/get_captured_pokemons.dart';
import 'package:flutter_block_pruebas/features/domain/usecases/search_pokemon.dart';
import 'package:flutter_block_pruebas/features/presentacion/bloc/pokemonBloc/search_pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {
  //Dio
  di.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    //Interceptors
    dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
      ErrorInterceptor(),
    ]);

    return dio;
  });

  //Bloc
  di.registerFactory(() => SearchPokemonBloc(di(), di(), di()));

  // Use cases
  di.registerLazySingleton(() => CapturePokemonUseCase(repository: di()));
  di.registerLazySingleton(() => GetCapturedPokemonsUseCase(repository: di()));
  di.registerLazySingleton(() => SearchPokemonUseCase(repository: di()));

  // Repository
  di.registerLazySingleton<PokemonRepository>(
    () => RepositoryPokemonImpl(
      pokemonRemoteDataSource: di(),
      pokemonLocalDatasource: di(),
    ),
  );

  // Data sources
  di.registerLazySingleton<PokemonLocalDatasource>(
    () => HivePokemonLocalDataSourceImpl(),
  );

  di.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(di()),
  );
}
