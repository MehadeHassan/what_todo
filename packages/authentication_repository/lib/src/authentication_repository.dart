import 'package:authentication_repository/authentication_repository.dart';

abstract class AuthenticationRepository {
  Stream<AuthenticationUser?> get authStateChanges;

  AuthenticationUser? get currentUser;

  Future<void> loginInWithEmailAndPassword(
    final String email,
    final String password,
  );

  Future<void> signUpWithEmailAndPassword(
    final String email,
    final String password,
  );

  Future<void> logOut();

  Future<void> logInAnonymously();

  Future<void> logInWithGoogle();

  Future<void> logInWithFacebook();

  Future<void> logInWithTwitter();

  Future<void> logInWithGithub();

  Future<void> resetPassword(final String email);
}
