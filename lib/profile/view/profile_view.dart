import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_todo/profile/profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (final context, final state) {
            if (state is ProfileInitial) {
              return Text(state.toString());
            } else if (state is ProfileLoading) {
              return const CircularProgressIndicator();
            } else if (state is ProfileLoaded) {
              return Text(state.user.uid);
            } else {
              return Column(
                children: const [
                  Text('umm! failed to load user'),
                  Icon(Icons.ac_unit),
                  Card(
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Text('try again later'),
                    ),
                  ),
                ],
              );
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Icon(Icons.account_circle),
              IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))
            ],
          ),
        ),
      );
}
