
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/user_repo_impl.dart';
import '../cubits/user_cubit.dart';
import '../cubits/user_states.dart';


class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserRepositoryImpl())..loadUser(),
      child: Center(
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const CircularProgressIndicator();
              } else if (state is UserLoaded) {
                final user = state.user;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(user.imageUrl),
                    ),
                    const SizedBox(height: 16),
                    Text(user.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(user.email, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                  ],
                );
              }
              return const Text("Welcome!");
            },
          ),
        ),
      );
  }
}
