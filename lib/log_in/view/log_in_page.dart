import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:what_todo/log_in/log_in.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({final Key? key}) : super(key: key);

  static Page<void> page() => MaterialPage<void>(
        child: BlocProvider(
          create: (final context) => LogInCubit(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
          child: const LogInPage(),
        ),
      );

  @override
  Widget build(final BuildContext context) =>
      BlocListener<LogInCubit, LogInState>(
        listener: (final context, final state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.exception?.message ?? 'Log In failure'),
                ),
              );
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Log In'),
            ),
            body: const LogInForm(),
          ),
        ),
      );
}
