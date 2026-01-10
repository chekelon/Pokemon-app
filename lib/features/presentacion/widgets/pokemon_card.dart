import 'package:flutter/material.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [Image.network(pokemon.detailUrl), Text(pokemon.name)],
      ),
    );
  }
}
