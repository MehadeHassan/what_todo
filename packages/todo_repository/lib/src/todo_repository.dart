import 'package:todo_repository/todo_repository.dart';

abstract class TodoRepository  {
  Stream<List<Todo>> get todos;
  Future<void> addTodo(final Todo todo);
  Future<void> deleteTodo(final String id);
  Future<void> updateTodo(final Todo todo);
  
}
