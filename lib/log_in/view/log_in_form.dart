// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:what_todo/log_in/log_in.dart';
import 'package:what_todo/sign_up/view/sign_up_page.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const <Widget>[
              SizedBox(height: 20),
              EmailForm(),
              SizedBox(height: 20),
              PasswordForm(),
              SizedBox(height: 20),
              LogInButton(),
              SizedBox(height: 20),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  LogInWithGoogle(),
                  LogInAnonymous(),
                ],
              ),
              SignUpButton(),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
}

class EmailForm extends StatelessWidget {
  const EmailForm({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<LogInCubit, LogInState>(
        buildWhen: (final previous, final current) =>
            previous.email != current.email,
        builder: (final context, final state) => TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (final value) {
            context.read<LogInCubit>().emailChanged(value);
          },
          decoration: InputDecoration(
            labelText: 'Email',
            errorText:
                state.status.isInvalid ? state.email.error?.message : null,
            border: const OutlineInputBorder(),
          ),
        ),
      );
}

class PasswordForm extends StatelessWidget {
  const PasswordForm({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<LogInCubit, LogInState>(
        buildWhen: (final previous, final current) =>
            previous.password != current.password,
        builder: (final context, final state) => TextField(
          // obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (final value) {
            context.read<LogInCubit>().passwordChanged(value);
          },
          decoration: InputDecoration(
            labelText: 'Password',
            errorText:
                state.status.isInvalid ? state.password.error?.message : null,
            border: const OutlineInputBorder(),
          ),
        ),
      );
}

class LogInButton extends StatelessWidget {
  const LogInButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<LogInCubit, LogInState>(
        buildWhen: (final previous, final current) =>
            previous.status != current.status,
        builder: (final context, final state) =>
            state.status.isSubmissionInProgress
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: state.status.isValidated
                        ? () {
                            FocusScope.of(context).unfocus();

                            context.read<LogInCubit>().logInPressed();
                          }
                        : null,
                    child: const Text('Log In'),
                  ),
      );
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => TextButton(
        onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
        child: const Text("Don't have an account"),
      );
}

class LogInWithGoogle extends StatelessWidget {
  const LogInWithGoogle({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => OutlinedButton(
        onPressed: context.read<LogInCubit>().logInWithGooglePressed,
        child: Text('Google'),
      );
}

class LogInAnonymous extends StatelessWidget {
  const LogInAnonymous({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => OutlinedButton(
        onPressed: context.read<LogInCubit>().logInAnonymousPressed,
        child: Text('Anonymous'),
      );
}
