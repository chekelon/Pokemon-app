import 'package:flutter/material.dart';
import 'package:flutter_block_pruebas/di.dart';
import 'package:flutter_block_pruebas/features/presentacion/bloc/pokemonBloc/search_pokemon_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_pruebas/features/presentacion/pages/pokemons_screen.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<SearchPokemonBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video Demo',
        home: const PokemonsScreen(),
      ),
    );
  }
}
