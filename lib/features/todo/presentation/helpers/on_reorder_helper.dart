import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';

void onReorderHelper(
    WidgetRef ref, int oldIndex, int newIndex, List<Todo> sortedTodos) {
  if (newIndex > oldIndex) {
    newIndex -= 1;
  }
  final Todo item = sortedTodos.removeAt(oldIndex);
  sortedTodos.insert(newIndex, item);

  for (int i = 0; i < sortedTodos.length; i++) {
    sortedTodos[i] = sortedTodos[i].copyWith(order: i);
  }

  ref.read(todoProvider.notifier).reorderTodos(sortedTodos);
}
