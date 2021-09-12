import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_validator/formz_validator.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required final AuthenticationRepository authenticationRepository,
    required final UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

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

  Future<void> signUpButtonPressed() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      try {
        try {
          await _authenticationRepository.signUpWithEmailAndPassword(
            state.email.value,
            state.password.value,
          );
          emit(
            state.copyWith(
              status: FormzStatus.submissionSuccess,
            ),
          );
          await _userRepository.addUser(
            User(uid: _authenticationRepository.currentUser!.uid),
          );
        } on Exception {
          logWarning('adding user to firestore failed');
        }
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
