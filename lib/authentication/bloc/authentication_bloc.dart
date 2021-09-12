import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required final AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          _currentUserToAuthenticationState(
            authenticationRepository.currentUser,
          ),
        ) {
    on<AuthenticationEvent>(_onAuthenticationEvent);
  }

  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<AuthenticationUser?>? _currentUserSubscription;

  @override
  Future<void> close() {
    _currentUserSubscription?.cancel();

    return super.close();
  }

  static AuthenticationState _currentUserToAuthenticationState(
    final AuthenticationUser? user,
  ) =>
      user != null
          ? const AuthenticationState(
              status: AuthenticationStatus.authenticated,
            )
          : const AuthenticationState(
              status: AuthenticationStatus.unauthenticated,
            );

  FutureOr<void> _onAuthenticationEvent(
    final AuthenticationEvent event,
    final Emitter<AuthenticationState> emit,
  ) async {
    if (event is AuthenticationEventSubscribedToAuthState) {
      
      await _currentUserSubscription?.cancel();
      _currentUserSubscription =
          _authenticationRepository.authStateChanges.listen(
        (final user) {
          add(AuthenticationEventUserToState(user));
        },
      );

    } else if (event is AuthenticationEventUserToState) {

      final user = event.user;
      emit(_currentUserToAuthenticationState(user));

    } else if (event is AuthenticationEventLogOut) {

      await _authenticationRepository.logOut();
    }
  }
}
