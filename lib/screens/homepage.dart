import 'package:blocoverview/cubits/counter_cubit/counter_cubit.dart';
import 'package:blocoverview/screens/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocProvider = BlocProvider.of<CounterCubit>(context, listen: true);
    return Scaffold(
      //BlocListener kapsamı olana BlocConsumer
      //Provider Consumer Widget'ı ile Bloc için aynı işlevi sağlar
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text("Counter is ${state.counter}"),
                    ));
          } else if (state.counter == -1) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => OtherPage()));
          }
        },
        builder: (context, state) {
          return BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              blocProvider.increment();
            },
            child: Icon(Icons.add),
            heroTag: "Increment",
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              blocProvider.decrement();
            },
            child: Icon(Icons.remove),
            heroTag: "Decrement",
          )
        ],
      ),
    );
  }
}


// class Homepage extends StatelessWidget {
//   const Homepage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var blocProvider = BlocProvider.of<CounterCubit>(context, listen: true);
//     return Scaffold(
//       //BlocBuilder return üstü provider tanımlamak ile eş değerdir
//       //Ama aktif Değişimleri kaldırması için BlocListener ile kaplanması gereklidir
//       //Fonksiyonları listener yapısı içine taşırız
//       body: BlocListener<CounterCubit, CounterState>(
//         listener: (context, state) {
//           if (state.counter == 3) {
//             showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                       content: Text("Counter is ${state.counter}"),
//                     ));
//           } else if (state.counter == -1) {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => OtherPage()));
//           }
//         },
//         child: BlocBuilder<CounterCubit, CounterState>(
//           builder: (context, state) {
//             return Center(
//               child: Text(
//                 '${state.counter}',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               blocProvider.increment();
//             },
//             child: Icon(Icons.add),
//             heroTag: "Increment",
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               blocProvider.decrement();
//             },
//             child: Icon(Icons.remove),
//             heroTag: "Decrement",
//           )
//         ],
//       ),
//     );
//   }
// }
