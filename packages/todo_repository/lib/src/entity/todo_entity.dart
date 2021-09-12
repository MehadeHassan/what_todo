import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

@immutable
class TodoEntity {
  const TodoEntity({
    required final this.id,
    required final this.task,
    required final this.isCompleted,
    required final this.createdAt,
  });

  factory TodoEntity.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      TodoEntity(
        id: snapshot.data()!['id'] as String,
        task: snapshot.data()!['task'] as String,
        isCompleted: snapshot.data()!['isCompleted'] as bool,
        createdAt: (snapshot.data()!['createdAt'] as Timestamp).toDate(),
      );

  final DateTime createdAt;
  final String id;
  final bool isCompleted;
  final String task;

  Map<String, dynamic> toFirestore() => <String, dynamic>{
        'task': task,
        'isCompleted': isCompleted,
        'createdAt': createdAt,
        'id': id,
      };
}
