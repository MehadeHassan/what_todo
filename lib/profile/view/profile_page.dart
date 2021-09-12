import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:what_todo/profile/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({final Key? key}) : super(key: key);
  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => ProfileCubit(
          userRepository: context.read<UserRepository>(),
        ),
        child: const ProfileView(),
      );
}
