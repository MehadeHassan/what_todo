import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class PasswordError extends Equatable {
  const PasswordError({
    required final this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
