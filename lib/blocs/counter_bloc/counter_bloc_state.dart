part of 'counter_bloc_bloc.dart';

class CounterBlocState extends Equatable {
  final int counter;
  CounterBlocState({
    required this.counter,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [counter];

  @override
  String toString() {
    return "CounterBlocState(counter: $counter)";
  }

  CounterBlocState copyWith({
    int? counter,
  }) {
    return CounterBlocState(
      counter: counter ?? this.counter,
    );
  }

  factory CounterBlocState.initial() {
    return CounterBlocState(counter: 0);
  }
}
