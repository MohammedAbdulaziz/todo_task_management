import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_task_management/config/config.dart';
import 'package:todo_task_management/features/todo/todo.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;
  final Function(Todo, bool?) onToggleComplete;
  final Function(Todo) onDelete;
  final Function(Todo) onEdit;

  const TodoListTile({
    Key? key,
    required this.todo,
    required this.onToggleComplete,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => {
        context.pushNamed(
          RoutesName.todoDetail,
          extra: todo,
        ),
      },
      child: Card(
        color: todo.isCompleted
            ? (isDarkMode ? Colors.black.withOpacity(0.9) : Colors.grey[300])
            : Theme.of(context).cardColor,
        margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
        elevation: 5,
        child: ListTile(
          contentPadding: EdgeInsets.all(8.0.r),
          leading: Checkbox(
            value: todo.isCompleted,
            onChanged: (value) => onToggleComplete(todo, value),
          ),
          title: Text(
            todo.title,
            style: todo.isCompleted
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
          ),
          subtitle: Text(todo.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => onEdit(todo),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => onDelete(todo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
