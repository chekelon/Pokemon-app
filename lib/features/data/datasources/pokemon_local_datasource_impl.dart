import 'package:flutter/material.dart';
import 'package:flutter_block_pruebas/core/error/failures.dart';
import 'package:flutter_block_pruebas/features/data/mappers/pokemon_mapper.dart';
import 'package:flutter_block_pruebas/features/data/models/pokemon_list_model.dart';
import 'package:flutter_block_pruebas/features/domain/datasources/pokemon_local_datasource.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HivePokemonLocalDataSourceImpl extends PokemonLocalDatasource {
  HivePokemonLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      final PokemonModel pokemonModel = PokemonModel(
        id: pokemon.id,
        name: pokemon.name,
        url: pokemon.detailUrl,
      );

      box.put(pokemon.id, pokemonModel.toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure(e.toString());
    }
  }

  @override
  Future<List<Pokemon>> getCapturedsPokemonList() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      List<PokemonModel> pokemonsModel = box.values
          .map((p) => PokemonModel.fromJson(Map<String, dynamic>.from(p)))
          .toList();
      return PokemonItemMapper.toEntity(pokemonsModel);
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure(e.toString());
    }
  }
}
