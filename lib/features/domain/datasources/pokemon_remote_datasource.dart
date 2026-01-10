import 'package:flutter_block_pruebas/features/data/models/pokemon_detail.dart';
import 'package:flutter_block_pruebas/features/domain/entities/paginate_pokemons_entity.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';

abstract class PokemonRemoteDataSource {
  Future<PaginatedPokemons> getPaginatePokemons();
  Future<PokemonDetail> getPokemonDetail(String url);
  Future<Pokemon> getPokemon(int id);
}
