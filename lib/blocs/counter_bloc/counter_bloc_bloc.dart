import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocoverview/blocs/color_bloc/color_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

// //Basic Bloc
// class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
//   CounterBlocBloc() : super(CounterBlocState.initial()) {
//     //Bloc içinde event tanımlamanın iki yolu vardır
//     //1) on<T> method içi method olarak
//     on<IncrementCounterEvent>((event, emit) {
//       emit(state.copyWith(counter: state.counter + 1));
//     });
//     //2) Tanımlanmış bir fonksiyonun on<T> methoduna parametre olarak eklemek
//     on<DecrementCounterEvent>(_decrementCounter);
//   }

//   void _decrementCounter(
//       DecrementCounterEvent event, Emitter<CounterBlocState> emit) {
//     emit(state.copyWith(counter: state.counter - 1));
//   }
// }

//Basic Bloc - Subscription
class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  int incrementSize = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription colorSubscription;

  //Basic Bloc - Stream
  CounterBlocBloc({required this.colorBloc})
      : super(CounterBlocState.initial()) {
    //Akış dinleme durumu için gerekli olan fonksiyonel yapı
    colorSubscription = colorBloc.stream.listen((ColorBlocState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
        add(ChangeCounterEvent());
      }
    });
    on<ChangeCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + incrementSize));
    });
  }
  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
