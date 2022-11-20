import 'package:blocoverview/cubits/counter_cubit/counter_cubit.dart';
import 'package:blocoverview/screens/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAccessHomepage extends StatelessWidget {
  const BlocAccessHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (counterContext) {
                    return BlocProvider.value(
                      value: context.read<CounterCubit>(),
                      child: ShowMeCounter(),
                    );
                  },
                ));
              },
              child: Text(
                "Show Me",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).increment();
              },
              child: Text(
                "Increment",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// //Bloc Access
// class BlocAccessHomepage extends StatelessWidget {
//   const BlocAccessHomepage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: BlocProvider<CounterCubit>(
//           create: (context) => CounterCubit(),
//           child: Builder(
//             builder: (context) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     " ${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}",
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText1!
//                         .copyWith(fontSize: 52),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       BlocProvider.of<CounterCubit>(context).increment();
//                     },
//                     child: Text(
//                       "Increment",
//                       style: Theme.of(context).textTheme.bodyText2,
//                     ),
//                   )
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
