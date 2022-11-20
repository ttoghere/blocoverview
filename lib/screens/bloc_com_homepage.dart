import 'package:blocoverview/blocs/color_bloc/color_bloc.dart';
import 'package:blocoverview/blocs/counter_bloc/counter_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

//Bloc Listener
class BlocComHomepage extends StatefulWidget {
  const BlocComHomepage({Key? key}) : super(key: key);

  @override
  State<BlocComHomepage> createState() => _BlocComHomepageState();
}

class _BlocComHomepageState extends State<BlocComHomepage> {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorBlocState>(
      listener: (context, colorState) {
        if (colorState.color == Colors.red) {
          incrementSize = 1;
        } else if (colorState.color == Colors.green) {
          incrementSize = 10;
        } else if (colorState.color == Colors.blue) {
          incrementSize = 100;
        } else if (colorState.color == Colors.black) {
          incrementSize = -100;
          context
              .read<CounterBlocBloc>()
              .add(ChangeCounterEvent(incrementSize: incrementSize));
        }
      },
      child: Scaffold(
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
                    .read<CounterBlocBloc>()
                    .add(ChangeCounterEvent(incrementSize: incrementSize));
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
// //Basic Bloc
// class BlocComHomepage extends StatelessWidget {
//   const BlocComHomepage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.watch<ColorBloc>().state.color,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               context.read<ColorBloc>().add(ChangeColorEvent());
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
//             context.watch<CounterBlocBloc>().state.counter.toString(),
//             style: TextStyle(
//                 fontSize: 62, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               context.read<CounterBlocBloc>().add(ChangeCounterEvent());
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
