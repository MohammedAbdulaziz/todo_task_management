import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';

Future<void> addTodoDialogHelper(BuildContext context, WidgetRef ref) async {
  final newTodo = await showDialog<Todo>(
    context: context,
    builder: (context) => const AddTodoDialog(),
  );
  if (newTodo != null) {
    ref.read(todoProvider.notifier).addTodo(newTodo);
  }
}
