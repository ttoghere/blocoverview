import 'package:blocoverview/blocs/color_bloc/color_bloc.dart';
import 'package:blocoverview/blocs/counter_bloc/counter_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

//Basic Bloc
class BlocComHomepage extends StatelessWidget {
  const BlocComHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorBloc>().state.color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ColorBloc>().add(ChangeColorEvent());
            },
            child: Text(
              "Change Color",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            context.watch<CounterBlocBloc>().state.counter.toString(),
            style: TextStyle(
                fontSize: 62, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBlocBloc>().add(ChangeCounterEvent());
            },
            child: Text(
              "Increment Counter",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
