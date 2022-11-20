import 'package:blocoverview/cubits/color_cubit/color_cubit.dart';
import 'package:blocoverview/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CubitComHomepage extends StatelessWidget {
  const CubitComHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ColorCubit>().changeColor();
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
            context.watch<CounterCubit>().state.counter.toString(),
            style: TextStyle(
                fontSize: 62, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterCubit>().changeCounter();
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
