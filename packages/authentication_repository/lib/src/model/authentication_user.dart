import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AuthenticationUser extends Equatable {
  const AuthenticationUser({
    required final this.uid,
  });

  final String uid;

  @override
  List<Object> get props => [uid];
}
