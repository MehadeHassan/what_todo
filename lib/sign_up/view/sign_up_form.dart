// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:what_todo/sign_up/sign_up.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({final Key? key}) : super(key: key);

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
              SignUpButton(),
              SizedBox(height: 20),
              LogInButton(),
            ],
          ),
        ),
      );
}

class EmailForm extends StatelessWidget {
  const EmailForm({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (final previous, final current) =>
            previous.email != current.email,
        builder: (final context, final state) => TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (final value) {
            context.read<SignUpCubit>().emailChanged(value);
          },
          decoration: InputDecoration(
            labelText: 'Email',
            errorText:
                state.status.isInvalid ? state.email.error?.message : null,
            border: OutlineInputBorder(),
          ),
        ),
      );
}

class PasswordForm extends StatelessWidget {
  const PasswordForm({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (final previous, final current) =>
            previous.password != current.password,
        builder: (final context, final state) => TextField(
          // obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (final value) {
            context.read<SignUpCubit>().passwordChanged(value);
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (final previous, final current) =>
            previous.status != current.status,
        builder: (final context, final state) =>
            (state.status == FormzStatus.submissionInProgress)
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: state.status.isValidated
                        ? () {
                            FocusScope.of(context).unfocus();

                            context.read<SignUpCubit>().signUpButtonPressed();
                          }
                        : null,
                    child: const Text('Sign Up'),
                  ),
      );
}

class LogInButton extends StatelessWidget {
  const LogInButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Already have an Account'),
      );
}
