import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:todo_repository/todo_repository.dart';

class FirestoreTodoRepository implements TodoRepository {
  FirestoreTodoRepository({
    final FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<void> addTodo(final Todo todo) async {
    try {
      await _todoCollectionRef.doc(todo.id).set(todo.toEntity());
    } on Exception {
      logWarning('failed to add $todo');

      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(final String id) async {
    try {
      await _todoCollectionRef.doc(id).delete();
    } on Exception {
      logWarning('failed to delete $id');

      rethrow;
    }
  }

  @override
  Stream<List<Todo>> get todos => _todoCollectionRef.snapshots().map(
        (final snapshot) => snapshot.docs
            .map((final doc) => Todo.fromEntity(doc.data()))
            .toList(),
      );

  @override
  Future<void> updateTodo(final Todo todo) async {
    try {
      await _todoCollectionRef
          .doc(todo.id)
          .update(todo.toEntity().toFirestore());
    } on Exception {
      logWarning('failed to add $todo');

      rethrow;
    }
  }

  CollectionReference<TodoEntity> get _todoCollectionRef =>
      _firestore.collection('todos').withConverter(
            fromFirestore: (final snapshot, final options) =>
                TodoEntity.fromFirestore(snapshot),
            toFirestore: (final value, final options) => value.toFirestore(),
          );
}
