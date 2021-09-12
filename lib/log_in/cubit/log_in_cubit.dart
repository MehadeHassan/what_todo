import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_validator/formz_validator.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit({
    required final AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LogInState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(final String input) {
    final email = EmailInput.dirty(input);
    final emailError = state.email.error;

    emit(
      state.copyWith(
        email: email,
        emailError: emailError,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(final String input) {
    final password = PasswordInput.dirty(input);
    final passwordError = state.password.error;


    emit(
      state.copyWith(
        password: password,
        passwordError: passwordError,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> logInPressed() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      try {
        await _authenticationRepository.loginInWithEmailAndPassword(
          state.email.value,
          state.password.value,
        );

        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
          ),
        );
      } on AuthenticationException catch (exception) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
            exception: exception,
          ),
        );
      }
    }
  }
}
