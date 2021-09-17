import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({
    required final TodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
        super(const TodoLoading());

  final TodoRepository _todoRepository;
  StreamSubscription<List<Todo>>? _todoSubscription;

  @override
  Future<void> close() {
    _todoSubscription?.cancel();
    
    return super.close();
  }

  Future<void> subscribeToTodos() async {
    emit(const TodoLoading());
    await _todoSubscription?.cancel();
    _todoSubscription = _todoRepository.todos.listen(_todosFetched);
  }

  Future<void> _todosFetched(final List<Todo> todos) async {
    emit(TodoLoaded(todos: todos));
  }

  Future<void> addTodo(final Todo todo) async {
    await _todoRepository.addTodo(todo);
  }

  Future<void> deleteTodo(final String id) async {
    await _todoRepository.deleteTodo(id);
  }

  Future<void> updateTodo(final Todo todo) async {
    await _todoRepository.updateTodo(todo);
  }
}
