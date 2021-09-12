import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repository/todo_repository.dart';
import 'package:user_repository/user_repository.dart';
// import 'package:todo_repository/todo_repository.dart';
// import 'package:user_repository/user_repository.dart';

import 'package:what_todo/authentication/authentication.dart';
import 'package:what_todo/theme/theme.dart';

class App extends StatelessWidget {
  const App({
    final Key? key,
    required final AuthenticationRepository authenticationRepository,
    required final UserRepository userRepository,
    required final TodoRepository todoRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        _todoRepository = todoRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  final TodoRepository _todoRepository;

  @override
  Widget build(final BuildContext context) => MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider.value(
          value: _userRepository,
        ),
        RepositoryProvider.value(
          value: _todoRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (final context) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
            )..add(const AuthenticationEventSubscribedToAuthState()),
          ),
          BlocProvider(
            create: (final context) => ThemeCubit(),
          ),
        ],
        child: const AppAuthentication(),
      ),
    );
}
