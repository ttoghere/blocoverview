import 'package:blocoverview/cubits/color_cubit/color_cubit.dart';
import 'package:blocoverview/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/src/provider.dart';


//Bloc Listener
class CubitComHomepage extends StatefulWidget {
  const CubitComHomepage({Key? key}) : super(key: key);

  @override
  State<CubitComHomepage> createState() => _CubitComHomepageState();
}

class _CubitComHomepageState extends State<CubitComHomepage> {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.black) {
          context.read<CounterCubit>().changeCounter(incrementSize: -100);
          incrementSize = -100;
        }
      },
      child: Scaffold(
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
                  fontSize: 62,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<CounterCubit>()
                    .changeCounter(incrementSize: incrementSize);
              },
              child: Text(
                "Increment Counter",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// //Basic Cubit
// class CubitComHomepage extends StatelessWidget {
//   const CubitComHomepage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.watch<ColorCubit>().state.color,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               context.read<ColorCubit>().changeColor();
//             },
//             child: Text(
//               "Change Color",
//               style: Theme.of(context).textTheme.headline3,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             context.watch<CounterCubit>().state.counter.toString(),
//             style: TextStyle(
//                 fontSize: 62, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               context
//                   .read<CounterCubit>()
//                   .changeCounter(incrementSize: incrementSize);
//             },
//             child: Text(
//               "Increment Counter",
//               style: Theme.of(context).textTheme.headline3,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }