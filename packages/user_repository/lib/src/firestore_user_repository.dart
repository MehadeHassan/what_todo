import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:user_repository/user_repository.dart';

class FirestoreUserRepository implements UserRepository {
  FirestoreUserRepository({
    final FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

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
  Future<User> getUser(final String uid) async {
    final snapshot = await users.doc(uid).get();
    final userEntity = snapshot.data();

    if (userEntity != null) {
      try {
        return User.fromEntity(userEntity);
      } on Exception {
        logWarning('failed to getUser $uid');
        rethrow;
      }
    }

    throw Exception('user not found');
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

  CollectionReference<UserEntity> get users =>
      _firestore.collection('users').withConverter(
            fromFirestore: (final snapshot, final _) =>
                UserEntity.fromFirestore(snapshot),
            toFirestore: (final value, final _) => value.toFirestore(),
          );
}
