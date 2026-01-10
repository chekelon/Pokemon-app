import 'package:equatable/equatable.dart';

enum CounterStatus { initial, loading, success, error }

class CounterState extends Equatable {
  final int count;
  final CounterStatus status;

  const CounterState({this.count = 0, this.status = CounterStatus.initial});

  CounterState copyWith({int? count, CounterStatus? status}) {
    return CounterState(
      count: count ?? this.count,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [count, status];
}
