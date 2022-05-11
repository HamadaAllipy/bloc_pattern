import 'dart:async';

import 'package:bloc_pattern/blocs/counter_events.dart';
import 'package:bloc_pattern/blocs/counter_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{

  int _counter = 0;


  CounterBloc() : super(InitialState()){
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
  }

  FutureOr<void> _onIncrement(IncrementEvent event, Emitter<CounterState> emit) {
    _counter++;
    emit(IncrementState());
  }




  static CounterBloc get (BuildContext context) => BlocProvider.of(context);

  int get counter => _counter;

  FutureOr<void> _onDecrement(DecrementEvent event, Emitter<CounterState> emit) {
    _counter--;
    emit(DecrementState());
  }
}