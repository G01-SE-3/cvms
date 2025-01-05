import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';


class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<bool> execute(User user,String username) async {
   
      return await repository.updateUser(user,username);
    }

   

}



