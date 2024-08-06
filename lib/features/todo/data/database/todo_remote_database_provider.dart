import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';

final todoRemoteDatabaseProvider = Provider<TodoRemoteDatabase>((ref) {
  return TodoRemoteDatabaseImpl();
});
