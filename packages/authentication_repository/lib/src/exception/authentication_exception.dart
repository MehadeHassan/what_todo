import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AuthenticationException extends Equatable implements Exception {
  const AuthenticationException({
    required final this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
