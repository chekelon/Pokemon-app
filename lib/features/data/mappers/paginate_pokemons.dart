import 'package:flutter_block_pruebas/features/data/mappers/pokemon_mapper.dart';
import 'package:flutter_block_pruebas/features/data/models/pokemon_list_model.dart';
import 'package:flutter_block_pruebas/features/domain/entities/paginate_pokemons_entity.dart';

class PokemonMapper {
  static PaginatedPokemons toEntity(PokemonListModel model) {
    return PaginatedPokemons(
      totalCount: model.count,
      next: model.next,
      previous: model.previous,
      pokemons: PokemonItemMapper.toEntity(model.results),
    );
  }
}
