import 'package:flutter/material.dart';
import 'package:todo_task_management/features/todo/todo.dart';

class EditTodoDialog extends StatefulWidget {
  final Todo todo;

  const EditTodoDialog({Key? key, required this.todo}) : super(key: key);

  @override
  EditTodoDialogState createState() => EditTodoDialogState();
}

class EditTodoDialogState extends State<EditTodoDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.todo.title;
    _descriptionController.text = widget.todo.description;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final updatedTodo = widget.todo.copyWith(
              title: _titleController.text,
              description: _descriptionController.text,
            );
            Navigator.of(context).pop(updatedTodo);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
