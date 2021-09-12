import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:user_repository/user_repository.dart';
import 'package:what_todo/sign_up/sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({final Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (final context) => BlocProvider(
          create: (final context) => SignUpCubit(
            authenticationRepository: context.read<AuthenticationRepository>(),
            userRepository: context.read<UserRepository>(),
          ),
          child: const SignUpPage(),
        ),
      );

  @override
  Widget build(final BuildContext context) =>
      BlocListener<SignUpCubit, SignUpState>(
        listener: (final context, final state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.exception?.message ?? 'Sign up failure'),
                ),
              );
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Sign Up'),
            ),
            body: const SignUpForm(),
          ),
        ),
      );
}
