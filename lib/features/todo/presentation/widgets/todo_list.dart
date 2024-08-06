import 'package:flutter/material.dart';
import 'package:todo_task_management/features/todo/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(int, int, List<Todo>) onReorder;
  final Function(Todo, bool?) onToggleComplete;
  final Function(Todo) onDelete;
  final Function(Todo) onEdit;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onReorder,
    required this.onToggleComplete,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) => onReorder(oldIndex, newIndex, todos),
      children: todos.map((todo) {
        return TodoListTile(
          key: ValueKey(todo.id),
          todo: todo,
          onToggleComplete: onToggleComplete,
          onDelete: onDelete,
          onEdit: onEdit,
        );
      }).toList(),
    );
  }
}
