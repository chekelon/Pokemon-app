import 'package:dartz/dartz.dart';
import 'package:flutter_block_pruebas/core/error/failures.dart';
import 'package:flutter_block_pruebas/features/domain/entities/paginate_pokemons_entity.dart';
import 'package:flutter_block_pruebas/features/domain/repositories/repository_pokemon.dart';

class GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCase(this.repository);

  Future<Either<Failure, PaginatedPokemons>> call() {
    return repository.getPaginatePokemons();
  }
}
