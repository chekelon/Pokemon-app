import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';

abstract class PokemonLocalDatasource {
  Future<bool> capturePokemon(Pokemon pokemon);
  Future<List<Pokemon>> getCapturedsPokemonList();
}
