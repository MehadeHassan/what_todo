import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:meta/meta.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  FirebaseAuthenticationRepository({
    final FirebaseAuth? firebaseAuth,
    final GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

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

  @override
  Future<void> logInWithGoogle() async {
    try {
      late final AuthCredential credential;
      if (isWeb) {
        final googleProvider = GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      logWarning('logInWithGoogle failed');

      throw e.toAuthenticationException;
    } on Exception {
      logError(
        'logInWithGoogle failed',
      );
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
