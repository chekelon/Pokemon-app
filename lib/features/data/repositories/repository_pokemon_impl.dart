import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_block_pruebas/core/error/exceptions.dart';
import 'package:flutter_block_pruebas/core/error/failures.dart';
import 'package:flutter_block_pruebas/features/domain/datasources/pokemon_local_datasource.dart';
import 'package:flutter_block_pruebas/features/domain/datasources/pokemon_remote_datasource.dart';
import 'package:flutter_block_pruebas/features/data/models/pokemon_detail.dart';
import 'package:flutter_block_pruebas/features/domain/entities/paginate_pokemons_entity.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_block_pruebas/features/domain/repositories/repository_pokemon.dart';

class RepositoryPokemonImpl implements PokemonRepository {
  final PokemonRemoteDataSource pokemonRemoteDataSource;
  final PokemonLocalDatasource pokemonLocalDatasource;

  RepositoryPokemonImpl({
    required this.pokemonRemoteDataSource,
    required this.pokemonLocalDatasource,
  });

  @override
  Future<Either<Failure, PaginatedPokemons>> getPaginatePokemons() async {
    try {
      final filteredData = await pokemonRemoteDataSource.getPaginatePokemons();
      return Right(filteredData);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, PokemonDetail>> getPokemonImage(String url) async {
    try {
      final pokemonDetail = await pokemonRemoteDataSource.getPokemonDetail(url);
      return Right(pokemonDetail);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
    try {
      final bool resp = await pokemonLocalDatasource.capturePokemon(pokemon);
      return Right(resp);
    } on LocalFailure catch (e) {
      return Left(LocalFailure(e.messages));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons() async {
    try {
      final resp = await pokemonLocalDatasource.getCapturedsPokemonList();
      return Right(resp);
    } on LocalFailure catch (e) {
      return Left(LocalFailure(e.messages));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getpokemon(int id) async {
    try {
      final pokemon = await pokemonRemoteDataSource.getPokemon(id);
      return Right(pokemon);
    } on Exception catch (e) {
      return Left(_mapServerExceptionToFailure(e));
    }
  }

  Failure _mapServerExceptionToFailure(Exception exception) {
    if (exception is NetworkException) {
      return const NetworkFailure('Sin conexión a internet');
    }

    if (exception is NetworkTimeoutException) {
      return const NetworkFailure('Tiempo de conexión agotado');
    }

    if (exception is ServerException) {
      switch (exception.statusCode) {
        case 404:
          return const NotFoundFailure();
        case 500:
          return const ServerFailure('Error interno del servidor');
        default:
          return const NetworkFailure('Error de red');
      }
    }
    return const UnknownFailure();
  }
}
