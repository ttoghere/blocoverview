import 'package:blocoverview/blocs/counter_bloc/counter_bloc_bloc.dart';
// import 'package:blocoverview/blocs/theme/theme_bloc.dart';
import 'package:blocoverview/cubits/counter_cubit/counter_cubit.dart';
import 'package:blocoverview/cubits/theme/theme_cubit.dart';
import 'package:blocoverview/screens/event_homepage.dart';
import 'package:blocoverview/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //Bloc karmaşık yapılarda kullanılır
  //Daha basit yapılar için cubit kullanılır
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: context.watch<ThemeCubit>().state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            title: 'Event Payload',
            home: EventHomepage(),
          );
        },
      ),
    );
  }
}

//Builder ve Bloc Versiyonu
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            title: 'Event Payload',
            home: EventHomepage(),
          );
        },
      ),
    );
  }
}
 */

// //BlocBuilder Versiyonu
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ThemeBloc>(
//       create: (context) => ThemeBloc(),
//       child: BlocBuilder<ThemeBloc, ThemeBlocState>(
//         builder: (context, state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: state.appTheme == AppTheme.light
//                 ? ThemeData.light()
//                 : ThemeData.dark(),
//             title: 'Event Payload',
//             home: EventHomepage(),
//           );
//         },
//       ),
//     );
//   }
// }

// //Bloc versiyonu
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CounterBlocBloc>(
//       create: (context) => CounterBlocBloc(),
//       child: MaterialApp(
//         title: 'Material App',
//         home: Homepage(),
//       ),
//     );
//   }
// }


//Cubit Versiyonu
/*
 class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Material App',
        home: Homepage(),
      ),
    );
  }
}
 */