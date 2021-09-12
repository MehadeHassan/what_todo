import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:path_provider/path_provider.dart';
import 'package:print_lumberdash/print_lumberdash.dart';
import 'package:todo_repository/todo_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:what_todo/app_observer.dart';
import 'package:what_todo/authentication/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  putLumberdashToWork(
    withClients: [
      PrintLumberdash(),
    ],
  );
  //* Forcing only portrait orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  Bloc.observer = AppBlocObserver();

  final authenticationRepository = FirebaseAuthenticationRepository();
  final todoRepository = FirestoreTodoRepository();
  final userRepository = FirestoreUserRepository();

  runApp(
    App(
      authenticationRepository: authenticationRepository,
      todoRepository: todoRepository,
      userRepository: userRepository,
    ),
  );
}
