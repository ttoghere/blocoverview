import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:blocoverview/cubits/color_cubit/color_cubit.dart';
// import 'dart:async';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // int incrementSize = 1;
  // final ColorCubit colorCubit;
  // late final StreamSubscription colorSubscription;

  //Cubit Listener
  CounterCubit() : super(CounterState.initial());

  // //Basic Cubit
  // CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
  //   //Akış dinleme durumu için gerekli olan fonksiyonel yapı
  //   colorSubscription = colorCubit.stream.listen((ColorState colorState) {
      // if (colorState.color == Colors.red) {
      //   incrementSize = 1;
      // } else if (colorState.color == Colors.green) {
      //   incrementSize = 10;
      // } else if (colorState.color == Colors.blue) {
      //   incrementSize = 100;
      // } else if (colorState.color == Colors.black) {
      //   emit(state.copyWith(counter: state.counter - 100));
      //   incrementSize = -100;
      // }
  //   });
  // }

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }

  //Listener Cubit
  void changeCounter({required int incrementSize}) {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }

  // //Basic Cubit
  // void changeCounter() {
  //   emit(state.copyWith(counter: state.counter + incrementSize));
  // }

  // //Basic Cubit
  // Future<void> close() {
  //   colorSubscription.cancel();
  //   return super.close();
  // }
}
