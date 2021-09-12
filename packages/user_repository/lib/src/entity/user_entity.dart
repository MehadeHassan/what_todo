import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

@immutable
class UserEntity {
  const UserEntity({
    required final this.uid,
  });

  factory UserEntity.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      UserEntity(
        uid: snapshot.id,
      );

  final String uid;

  Map<String, dynamic> toFirestore() => <String, dynamic>{
        'uid': uid,
      };
}
