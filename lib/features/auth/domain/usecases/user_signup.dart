import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';


class UserSignup {

  AuthRepo authRepo;
  
  UserSignup(this.authRepo);

  Future<Either<Failure , UserEntity>> call(String email , String pass , String name){
    return authRepo.signUp(email, pass , name);
  }
}