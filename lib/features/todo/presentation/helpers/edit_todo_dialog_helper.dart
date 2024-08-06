import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';

Future<void> editTodoDialogHelper(
    BuildContext context, WidgetRef ref, Todo todo) async {
  final updatedTodo = await showDialog<Todo>(
    context: context,
    builder: (context) => EditTodoDialog(todo: todo),
  );

  if (updatedTodo != null) {
    ref.read(todoProvider.notifier).updateTodo(updatedTodo);
  }
}
