import 'package:dartz/dartz.dart';
import 'package:flutter_block_pruebas/core/error/failures.dart';
import 'package:flutter_block_pruebas/features/data/models/pokemon_detail.dart';
import 'package:flutter_block_pruebas/features/domain/entities/paginate_pokemons_entity.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PaginatedPokemons>> getPaginatePokemons();
  Future<Either<Failure, PokemonDetail>> getPokemonImage(String url);
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons();
  Future<Either<Failure, Pokemon>> getpokemon(int id);
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon);
}
