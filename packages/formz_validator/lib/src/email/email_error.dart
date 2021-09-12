import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class EmailError extends Equatable {
  const EmailError({
    required final this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
