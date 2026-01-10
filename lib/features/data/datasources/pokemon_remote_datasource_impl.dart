import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_block_pruebas/core/error/exceptions.dart';
import 'package:flutter_block_pruebas/core/network/interceptors/network_constants.dart';
import 'package:flutter_block_pruebas/features/data/mappers/pokemon_mapper.dart';
import 'package:flutter_block_pruebas/features/domain/datasources/pokemon_remote_datasource.dart';
import 'package:flutter_block_pruebas/features/data/mappers/paginate_pokemons.dart';
import 'package:flutter_block_pruebas/features/data/models/pokemon_list_model.dart';
import 'package:flutter_block_pruebas/features/data/models/pokemon_detail.dart';
import 'package:flutter_block_pruebas/features/domain/entities/paginate_pokemons_entity.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<PaginatedPokemons> getPaginatePokemons({int offset = 0}) async {
    try {
      final response = await dio.get(
        '/pokemon',
        queryParameters: {
          'limit': NetworkConstants.pageLimit,
          'offset': offset,
        },
      );

      PokemonListModel listModel = PokemonListModel.fromJson(response.data);

      final pokemons = await Future.wait(
        listModel.results.map((_enrichPokemon)).toList(),
      );

      return PokemonMapper.toEntity(listModel.copyWith(results: pokemons));
    } on DioException catch (e) {
      if (e.error is Exception) {
        throw e.error!;
      }
      rethrow;
    }
  }

  @override
  Future<PokemonDetail> getPokemonDetail(String url) async {
    try {
      final response = await dio.get(url);
      return PokemonDetail.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is Exception) {
        throw e.error!;
      }
      rethrow;
    }
  }

  @override
  Future<Pokemon> getPokemon(int id) async {
    try {
      final resp = await dio.get('/pokemon/$id/');
      PokemonDetail pokemon = PokemonDetail.fromJson(resp.data);

      return PokemonItemMapper.toEntityPokemon(pokemon);
    } on DioException catch (e) {
      if (e.error is Exception) {
        throw e.error!;
      }
      rethrow;
    }
  }

  Future<PokemonModel> _enrichPokemon(PokemonModel pokemon) async {
    final detail = await getPokemonDetail(pokemon.url);

    return pokemon.copyWith(
      id: detail.id,
      urlImage: detail.sprites.other?.home.frontDefault,
      height: detail.height,
      weight: detail.weight,
      abilities: detail.abilities.map((a) => a.ability?.name ?? '').toList(),
      types: detail.types.map((t) => t.type.name).toList(),
    );
  }
}
