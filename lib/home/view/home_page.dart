import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_todo/home/home.dart';
import 'package:what_todo/profile/profile.dart';
import 'package:what_todo/todo/todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({final Key? key}) : super(key: key);

  static Page<void> page() => MaterialPage<void>(
        child: BlocProvider(
          create: (final context) => BottomNavigationCubit(),
          child: const HomePage(),
        ),
      );

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: BlocBuilder<BottomNavigationCubit, int>(
          builder: (final context, final state) => IndexedStack(
            index: state,
            children: const [
              ProfilePage(),
              TodoPage(),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<BottomNavigationCubit, int>(
          builder: (final context, final state) => BottomNavigationBar(
            currentIndex: state,
            onTap: context.read<BottomNavigationCubit>().changePage,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
}
