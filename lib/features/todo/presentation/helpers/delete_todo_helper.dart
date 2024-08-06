import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';

void deleteTodoHelper(WidgetRef ref, Todo todo) {
  ref.read(todoProvider.notifier).deleteTodo(todo);
}
