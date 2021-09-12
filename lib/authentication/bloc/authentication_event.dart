part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

@immutable
class AuthenticationEventSubscribedToAuthState extends AuthenticationEvent {
  const AuthenticationEventSubscribedToAuthState();
}

@immutable
class AuthenticationEventUserToState extends AuthenticationEvent
    with EquatableMixin {
  const AuthenticationEventUserToState(this.user);

  final AuthenticationUser? user;

  @override
  List<Object?> get props => [user];
}

@immutable
class AuthenticationEventLogOut extends AuthenticationEvent {
  const AuthenticationEventLogOut();
}

@immutable
class AuthenticationShowSingUp extends AuthenticationEvent {
  const AuthenticationShowSingUp();
}
