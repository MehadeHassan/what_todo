import 'package:formz/formz.dart';
import 'package:formz_validator/formz_validator.dart';
import 'package:meta/meta.dart';

@immutable
class EmailInput extends FormzInput<String, EmailError> {
  const EmailInput.dirty([
    final String initialValue = '',
  ]) : super.dirty(initialValue);

  const EmailInput.pure() : super.pure('');

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailError? validator(final String value) {

    final email = value.trim();
    if (email.isEmpty) {
      return const EmailError(message: 'Email is required');
    }
    if (!_emailRegExp.hasMatch(email)) {
      return const EmailError(message: 'Email is invalid');
    }

    else {
      return null;
    }
  }
}
