import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_task_management/features/todo/todo.dart';

class DetailsPage extends ConsumerWidget {
  final Todo todo;

  const DetailsPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoProvider);
    final updatedTodo =
        todoState.todos?.firstWhere((t) => t.id == todo.id, orElse: () => todo);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => editTodoDialogHelper(context, ref, todo),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              updatedTodo!.title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 16.h),
            Text(
              'Status: ${updatedTodo.isCompleted ? 'Completed' : 'Pending'}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16.h),
            Text(
              'Description:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 4.h),
            Text(
              updatedTodo.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
