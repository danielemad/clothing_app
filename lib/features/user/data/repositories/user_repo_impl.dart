import '../../../../dummy_data/user.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repo.dart';


class UserRepositoryImpl implements UserRepository {
  @override
  User getUserDetails()  {
    return user;
  }
}