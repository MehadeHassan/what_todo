part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unauthenticated,
  authenticated,
}

@immutable
class AuthenticationState extends Equatable {
  const AuthenticationState({
    required final this.status,
  });

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];

}
