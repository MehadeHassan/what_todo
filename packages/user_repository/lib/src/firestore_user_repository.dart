import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:user_repository/user_repository.dart';

class FirestoreUserRepository implements UserRepository {
  FirestoreUserRepository({
    final FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<UserEntity> get users =>
      _firestore.collection('users').withConverter(
            fromFirestore: (final snapshot, final _) =>
                UserEntity.fromFirestore(snapshot),
            toFirestore: (final value, final _) => value.toFirestore(),
          );

  @override
  Future<void> addUser(final User user) async {
    try {
      await users.doc(user.uid).set(user.toEntity());
    } on Exception {
      logWarning('failed to addUser $user');

      rethrow;
    }
  }

  @override
  Future<void> deleteUser(final User user) async {
    try {
      await users.doc(user.uid).delete();
    } on Exception {
      logWarning('failed to deleteUser $user');

      rethrow;
    }
  }

  @override
  Future<void> updateUser(final User user) async {
    try {
      await users.doc(user.uid).update(user.toEntity().toFirestore());
    } on Exception {
      logWarning('failed to updateUser $user');

      rethrow;
    }
  }
}
