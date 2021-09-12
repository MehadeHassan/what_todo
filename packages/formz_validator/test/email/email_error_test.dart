import 'package:flutter_test/flutter_test.dart';
import 'package:formz_validator/formz_validator.dart';

void main() {
  group(
    'EmailErrorTest -',
    () {
      const message = 'Invalid email';

      const emailError1 = EmailError(message: message);
      const emailError2 = EmailError(message: message);

      test(
        'two instance of the EmailError class, holding the same value should be equals',
        () {
          expect(emailError1, equals(emailError2));
        },
      );


      
    },
  );
}
