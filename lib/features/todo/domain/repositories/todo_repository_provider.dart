import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final todoRemoteDatabase = ref.read(todoRemoteDatabaseProvider);
  return TodoRepositoryImpl(todoRemoteDatabase: todoRemoteDatabase);
});
