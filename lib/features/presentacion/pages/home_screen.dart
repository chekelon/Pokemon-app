import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    //context.read<PokemonBloc>().add(LoadPokemons());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Pokemons'),
        elevation: 3.0,
        shadowColor: Colors.grey,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22.0),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoading) {
                  return CircularProgressIndicator();
                } else if (state is PokemonLoaded) {
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        ...state.paginatePokemons.pokemons.map((pokemonItem) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    PokemonDetails(pokemon: pokemonItem),
                              ),
                            ),
                            child: Card(
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    pokemonItem.detailUrl.isNotEmpty
                                        ? pokemonItem.detailUrl
                                        : 'https://via.placeholder.com/150',
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                    pokemonItem.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                } else if (state is PokemonError) {
                  return Text('Error: ${state.message}');
                }
                return SizedBox.shrink();
              },
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
