// domain/entities/paginated_pokemons.dart

import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';

class PaginatedPokemons {
  final int totalCount;
  final String? next;
  final String? previous;
  final List<Pokemon> pokemons;

  PaginatedPokemons({
    required this.totalCount,
    required this.pokemons,
    this.next,
    this.previous,
  });
}
