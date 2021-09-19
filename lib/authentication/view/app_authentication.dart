import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latim_repository/latim_repository.dart';
import 'package:what_todo/authentication/authentication.dart';
import 'package:what_todo/home/home.dart';
import 'package:what_todo/log_in/log_in.dart';
import 'package:what_todo/theme/theme.dart';

class AppAuthentication extends StatelessWidget {
  const AppAuthentication({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final themeMode =
        context.select<ThemeCubit, ThemeMode>((final cubit) => cubit.state);

    final authenticationState =
        context.select<AuthenticationBloc, AuthenticationState>(
      (final bloc) => bloc.state,
    );

    return MaterialApp(
      title: 'What ToDo',
      theme: appTheme(colorScheme: lightColorScheme),
      darkTheme: appTheme(colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      home: const ThemePage(),

      // home: FlowBuilder<AuthenticationState>(
      //   key: GlobalKey(debugLabel: 'AppAuthentication'),
      //   state: authenticationState,
      //   onGeneratePages: (final state, final _) {
      //     switch (state.status) {
      //       case AuthenticationStatus.authenticated:
      //         return [HomePage.page()];
      //       case AuthenticationStatus.unauthenticated:
      //         return [LogInPage.page()];
      //     }
      //   },
      // ),
    );
  }
}
