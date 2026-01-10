import 'package:dartz/dartz.dart';
import 'package:flutter_block_pruebas/core/error/failures.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_block_pruebas/features/domain/repositories/repository_pokemon.dart';

class SearchPokemonUseCase {
  final PokemonRepository repository;

  SearchPokemonUseCase({required this.repository});

  Future<Either<Failure, Pokemon>> call(int id) {
    return repository.getpokemon(id);
  }
}
