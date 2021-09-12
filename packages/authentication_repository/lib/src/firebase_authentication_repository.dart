import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lumberdash/lumberdash.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  FirebaseAuthenticationRepository({
    final FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Stream<AuthenticationUser?> get authStateChanges =>
      _firebaseAuth.authStateChanges().map(
            (final user) => user?.toAuthenticationUser,
          );

  @override
  AuthenticationUser? get currentUser =>
      _firebaseAuth.currentUser?.toAuthenticationUser;

  @override
  Future<void> logInAnonymously() async {
    try {
      await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      log(e.code, name: 'logInAnonymously');
      throw e.toAuthenticationException;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      log(e.code, name: 'logOut');
      throw e.toAuthenticationException;
    }
  }

  @override
  Future<void> loginInWithEmailAndPassword(
    final String email,
    final String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      logWarning('loginInWithEmailAndPassword called');
    } on FirebaseAuthException catch (e) {
      log(e.code, name: 'loginInWithEmailAndPassword');
      throw e.toAuthenticationException;
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(
    final String email,
    final String password,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      log(e.code, name: 'signUpWithEmailAndPassword');
      throw e.toAuthenticationException;
    }
  }
}

extension on User {
  AuthenticationUser get toAuthenticationUser => AuthenticationUser(
        uid: uid,
      );
}

extension on FirebaseAuthException {
  AuthenticationException get toAuthenticationException =>
      AuthenticationException(message: message ?? code);
}
