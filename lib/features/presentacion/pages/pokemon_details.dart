import 'package:flutter/material.dart';
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double height = (pokemon.height * 10) / 100;
    final double weight = pokemon.weight.toDouble();
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          pokemon.name.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
        elevation: 3.0,
        centerTitle: true,
        shadowColor: Colors.grey,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Container(
          width: size.width * 0.90,
          height: size.height * 0.55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: size.width * 0.90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.10),
                    Text(
                      pokemon.name.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    Text("Height : $height m"),
                    SizedBox(height: size.height * 0.015),
                    Text("Weight : $weight kg"),
                    SizedBox(height: size.height * 0.05),
                    const Text(
                      "Types",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...pokemon.types?.map(
                              (type) => Chip(
                                label: Text(
                                  type,
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ) ??
                            [Text('Sin Types')],
                      ],
                    ),
                  ],
                ),
              ),

              Positioned(
                top: -250,
                child: SizedBox(
                  width: size.width * 0.90,
                  child: Image.network(pokemon.detailUrl, scale: 1.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
