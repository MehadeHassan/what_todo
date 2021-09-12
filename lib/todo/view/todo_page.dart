import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_repository/todo_repository.dart';
import 'package:what_todo/authentication/authentication.dart';
import 'package:what_todo/theme/theme.dart';
import 'package:what_todo/todo/todo.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => TodoCubit(
          todoRepository: context.read<TodoRepository>(),
        )..subscribeToTodos(),
        child: const NewWidget(),
      );
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.toggle_off_rounded),
              onPressed: context.read<ThemeCubit>().toggleThemeMode,
            ),
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                      const AuthenticationEventLogOut(),
                    );
              },
            ),
          ],
        ),
        drawer: const Drawer(),
        body: Center(
          child: BlocBuilder<TodoCubit, TodoState>(
            builder: (final context, final state) {
              if (state is TodoLoading) {
                return const CircularProgressIndicator.adaptive();
              }

              if (state is TodoLoaded) {
                final todos = state.todos;

                if (todos.isEmpty) {
                  return const Text(
                    "umm, looks like you don't have any ToDos",
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (final context, final index) =>
                        TodoItem(todo: todos[index]),
                    itemCount: todos.length,
                  );
                }
              }

              if (state is TodoFailure) {
                return const Text('Failed to load todos');
              }

              return const Text(
                "umm, looks like you don't have any ToDos",
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (final builderContext) => AddNewTodo(
                onAdd: (final todo) {
                  context.read<TodoCubit>().addTodo(
                        todo,
                      );
                  Navigator.of(builderContext).pop();
                },
              ),
            );
          },
        ),
      );
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    final Key? key,
    required final Todo todo,
  })  : _todo = todo,
        super(key: key);

  final Todo _todo;

  @override
  Widget build(final BuildContext context) => Dismissible(
        key: Key(_todo.id),
        onDismissed: (final direction) {
          context.read<TodoCubit>().deleteTodo(_todo.id);
        },
        background: Container(
          color: Colors.yellow,
        ),
        child: CheckboxListTile(
          value: _todo.isCompleted,
          title: Text(_todo.task),
          subtitle: Text(
            DateFormat.yMMMd().format(_todo.createdAt),
          ),
          onChanged: (final value) {
            context.read<TodoCubit>().updateTodo(
                  _todo.copyWith(isCompleted: value),
                );
          },
        ),
      );
}
