import 'package:bloc/bloc.dart';
import 'package:flutter_block_pruebas/features/presentacion/bloc/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState()) {
    getFakeData();
  }

  void increment() => emit(state.copyWith(count: state.count + 1));

  Future<void> getFakeData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: CounterStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: CounterStatus.success));
      emit(state.copyWith(count: 3));
    } catch (_) {
      emit(state.copyWith(status: CounterStatus.error));
    }
  }
}
