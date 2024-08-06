import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';

void toggleCompleteHelper(WidgetRef ref, Todo todo, bool? isCompleted) {
  ref.read(todoProvider.notifier).updateTodo(
        todo.copyWith(isCompleted: isCompleted),
      );
}
