import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_pruebas/core/error/failures.dart';
import 'package:flutter_block_pruebas/core/utils/utils.dart' as utlis;
import 'package:flutter_block_pruebas/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_block_pruebas/features/domain/usecases/capture_pokemon.dart';
import 'package:flutter_block_pruebas/features/domain/usecases/get_captured_pokemons.dart';
import 'package:flutter_block_pruebas/features/domain/usecases/search_pokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  final CapturePokemonUseCase _capturePokemonUseCase;
  final GetCapturedPokemonsUseCase _getCapturedPokemonsUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;

  SearchPokemonBloc(
    this._capturePokemonUseCase,
    this._getCapturedPokemonsUseCase,
    this._searchPokemonUseCase,
  ) : super(SearchPokemonInitial()) {
    on<OnSearchPokemon>((event, emit) async {
      emit(SearchPokemonLoading());

      final resp = await _searchPokemonUseCase(utlis.randomPokemonId);

      resp.fold(
        (f) => emit(SearchPokemonFailure(failure: f)),
        (p) => emit(SearchPokemonSuccess(pokemon: p)),
      );
    });

    on<OnCapturePokemon>((event, emit) async {
      final resp = await _capturePokemonUseCase(event.pokemon);

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)), (p) {});
    });

    on<OnGetCapturedPokemons>((event, emit) async {
      final resp = await _getCapturedPokemonsUseCase();

      resp.fold(
        (f) => emit(SearchPokemonFailure(failure: f)),
        (ps) => emit(SearchPokemonList(pokemons: ps)),
      );
    });
  }
}
