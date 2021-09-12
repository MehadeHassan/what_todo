import 'package:formz/formz.dart';
import 'package:formz_validator/formz_validator.dart';
import 'package:meta/meta.dart';

@immutable
class PasswordInput extends FormzInput<String, PasswordError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([
    final String initialValue = '',
  ]) : super.dirty(initialValue);

  static final _passwordRegex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
  );

  @override
  PasswordError? validator(final String value) {
    final password = value.trim();

    if (password.isEmpty) {
      return const PasswordError(message: 'Password is required');
    }
    if (password.length < 6) {
      return const PasswordError(
        message: 'Password must be at least 6 characters long',
      );
    }
    if (!_passwordRegex.hasMatch(password)) {
      return const PasswordError(
        message: 'Password must contain at least 1 letter and 1 number',
      );
    } else {
      return null;
    }
  }
}
