import 'package:bloc_pattern/blocs/counter_bloc.dart';
import 'package:bloc_pattern/blocs/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                bloc.add(IncrementEvent());
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state){
                return Text(
                  '${bloc.counter}',
                  style: const TextStyle(
                    fontSize: 60,
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(DecrementEvent());
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
