
import 'package:user_repository/src/model/user.dart';

abstract class UserRepository {
  Future<void> addUser(final User user);
  Future<void> deleteUser(final User user);
  Future<void> updateUser(final User user);
  

  
}
