import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_repository/todo_repository.dart';
import 'package:uuid/uuid.dart';

@immutable
class Todo extends Equatable {
  Todo({
    required final this.task,
    final String? id,
    final bool? isCompleted,
    final DateTime? createdAt,
  })  : id = id ?? const Uuid().v4(),
        isCompleted = isCompleted ?? false,
        createdAt = createdAt ?? DateTime.now();

  factory Todo.fromEntity(final TodoEntity entity) => Todo(
        id: entity.id,
        task: entity.task,
        isCompleted: entity.isCompleted,
        createdAt: entity.createdAt,
      );

  final DateTime createdAt;
  final String id;
  final bool isCompleted;
  final String task;

  @override
  List<Object> get props => [id, task, isCompleted, createdAt];

  TodoEntity toEntity() => TodoEntity(
        id: id,
        task: task,
        isCompleted: isCompleted,
        createdAt: createdAt,
      );

  Todo copyWith({
    final DateTime? createdAt,
    final String? id,
    final bool? isCompleted,
    final String? task,
  }) =>
      Todo(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        isCompleted: isCompleted ?? this.isCompleted,
        task: task ?? this.task,
      );
}
