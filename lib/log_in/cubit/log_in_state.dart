part of 'log_in_cubit.dart';

@immutable
class LogInState extends Equatable {
  const LogInState({
    final this.status = FormzStatus.pure,
    final this.email = const EmailInput.pure(),
    final this.password = const PasswordInput.pure(),
    final this.exception,
    final this.emailError,
    final this.passwordError,
  });

  final EmailInput email;
  final EmailError? emailError;
  final PasswordInput password;
  final PasswordError? passwordError;
  final FormzStatus status;
  final AuthenticationException? exception;

  @override
  List<Object?> get props => [
        email,
        emailError,
        password,
        passwordError,
        status,
        exception,
      ];

  LogInState copyWith({
    final EmailInput? email,
    final EmailError? emailError,
    final PasswordInput? password,
    final PasswordError? passwordError,
    final FormzStatus? status,
    final AuthenticationException? exception,
  }) =>
      LogInState(
        email: email ?? this.email,
        emailError: emailError ?? this.emailError,
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        status: status ?? this.status,
        exception: exception ?? this.exception,
      );
}
