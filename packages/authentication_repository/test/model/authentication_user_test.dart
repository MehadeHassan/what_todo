import 'package:authentication_repository/src/model/authentication_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'AuthenticationUserTest -',
    () {
      const uid = 'uid';
      const user1 = AuthenticationUser(uid: uid);
      const user2 = AuthenticationUser(uid: uid);

      test(
        'Two instance of the same class, holding the same value should be equal',
        () {
          expect(user1, equals(user2));
        },
      );
    },
  );
}
