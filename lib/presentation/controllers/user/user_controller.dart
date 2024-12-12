/* USED TO CALL THE USE CASES*/
/*
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/get_user_by_id.dart';
import '../../../domain/usecases/add_user.dart';

class UserController {
  final GetUserById getUserById;
  final AddUser addUser;

  UserController({
    required this.getUserById,
    required this.addUser,
  });

  Future<User?> fetchUser(int id) async {
    return await getUserById.execute(id);
  }

  Future<void> addNewUser(User user, String hashedPassword) async {
    await addUser.execute(user, hashedPassword);
  }
}
*/