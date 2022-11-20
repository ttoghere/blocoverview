import 'dart:math';

import 'package:blocoverview/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventHomepage extends StatelessWidget {
  const EventHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            print("RandInt: $randInt");
            BlocProvider.of<ThemeBloc>(context)
                .add(ChangeThemeEvent(randInt: randInt));
          },
          child: Text(
            "Change Theme",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
