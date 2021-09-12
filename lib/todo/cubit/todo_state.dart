part of 'todo_cubit.dart';

@immutable
abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}
// @immutable
// class TodoInitial extends TodoState {
//   const TodoInitial();
// }

@immutable
class TodoLoading extends TodoState {
  const TodoLoading();
}

@immutable
class TodoLoaded extends TodoState {
  const TodoLoaded({
    required final this.todos,
  });

  final List<Todo> todos;

  @override
  List<Object> get props => [todos];
}

@immutable
class TodoFailure extends TodoState {
  const TodoFailure();
}
