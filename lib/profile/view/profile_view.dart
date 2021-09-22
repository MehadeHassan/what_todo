// import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_todo/profile/profile.dart';
// import 'package:adaptive_navigation/adaptive_navigation.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (final context, final state) {
            // if (state is ProfileInitial) {
            //   return Text(state.toString());
            // } else if (state is ProfileLoading) {
            //   return const CircularProgressIndicator();
            // } else if (state is ProfileLoaded) {
            //   return Text(state.user.uid);
            // } else
            //
            {
              return AdaptiveContainer(
                constraints: const AdaptiveConstraints(
                  xsmall: true,
                  small: false,
                  medium: true,
                  large: false,
                  xlarge: true,
                ),
                color: Colors.red,
                child: const Text('This is an extra small window'),
              );
            }
          },
        ),
      );
}
