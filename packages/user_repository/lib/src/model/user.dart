import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

@immutable
class User extends Equatable {
  const User({
    required final  this.uid,
  });

  factory User.fromEntity(final UserEntity user) => User(uid: user.uid);

  final String uid;

  @override
  List<Object> get props => [uid];

  UserEntity toEntity() => UserEntity(uid: uid);
}
