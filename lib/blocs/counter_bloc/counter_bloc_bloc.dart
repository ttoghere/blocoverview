import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBlocBloc() : super(CounterBlocState.initial()) {
    //Bloc içinde event tanımlamanın iki yolu vardır
    //1) on<T> method içi method olarak
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
    //2) Tanımlanmış bir fonksiyonun on<T> methoduna parametre olarak eklemek
    on<DecrementCounterEvent>(_decrementCounter);
  }

  void _decrementCounter(
      DecrementCounterEvent event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
