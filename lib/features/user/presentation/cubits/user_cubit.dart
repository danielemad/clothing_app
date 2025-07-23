import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/user_repo.dart';
import 'user_states.dart';


class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(UserInitial());

  void loadUser() async {
    emit(UserLoading());
    final user = await repository.getUserDetails();
    emit(UserLoaded(user));
  }
}
