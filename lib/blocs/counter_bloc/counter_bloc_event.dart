part of 'counter_bloc_bloc.dart';

abstract class CounterBlocEvent extends Equatable {
  const CounterBlocEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends CounterBlocEvent {}

class DecrementCounterEvent extends CounterBlocEvent {}

class ChangeCounterEvent extends CounterBlocEvent {}
