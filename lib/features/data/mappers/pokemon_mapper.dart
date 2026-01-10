import 'package:flutter_block_pruebas/features/data/models/pokemon_detail.dart';
import 'package:flutter_block_pruebas/features/data/models/pokemon_list_model.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';

class PokemonItemMapper {
  static List<Pokemon> toEntity(List<PokemonModel> pokemons) {
    return pokemons
        .map(
          (pokemon) => Pokemon(
            id: pokemon.id,
            name: pokemon.name,
            detailUrl: pokemon.urlImage == "" ? pokemon.url : '',
            height: pokemon.height,
            weight: pokemon.weight,
            abilities: pokemon.abilities ?? [],
            types: pokemon.types ?? [],
          ),
        )
        .toList();
  }

  static Pokemon toEntityPokemon(PokemonDetail pokemon) {
    return Pokemon(
      id: pokemon.id,
      detailUrl: pokemon.sprites.frontDefault,
      name: pokemon.name,
      abilities: pokemon.abilities.map((p) => p.ability!.name).toList(),
      height: pokemon.height,
      weight: pokemon.weight,
      types: pokemon.types.map((p) => p.type.name).toList(),
    );
  }
}
