import 'package:dartz/dartz.dart';
import 'package:flutter_block_pruebas/core/error/failures.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_block_pruebas/features/domain/repositories/repository_pokemon.dart';

class GetCapturedPokemonsUseCase {
  final PokemonRepository repository;

  GetCapturedPokemonsUseCase({required this.repository});

  Future<Either<Failure, List<Pokemon>>> call() {
    return repository.getCapturedPokemons();
  }
}
